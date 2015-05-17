/*************************************************************/
/* Tape Emulator Control                                     */
/*************************************************************/
#include "tape_controller.h"
#include "menu.h"
#include "filemanager.h"

TapeController *tape_controller = NULL; // globally static

#define MENU_C2N_PAUSE         0x3201
#define MENU_C2N_RESUME        0x3202
#define MENU_C2N_STATUS        0x3203
#define MENU_C2N_STOP          0x3204

static void poll_tape(Event &e)
{
	tape_controller->poll(e);
}

TapeController :: TapeController()
{
    file = NULL;
	paused = 0;
	recording = 0;
	controlByte = 0;
	blockBuffer = new BYTE[512];
	stop();
    poll_list.append(&poll_tape);
	main_menu_objects.append(this);
}

TapeController :: ~TapeController()
{
	poll_list.remove(&poll_tape);
	main_menu_objects.remove(this);
	delete blockBuffer;
}

int  TapeController :: fetch_task_items(IndexedList<Action*> &item_list)
{
    if(!file)
        return 0;
	if(ferror(file)) {
    	close();
		return 0;
	}
	if(paused)
		item_list.append(new Action("Resume Tape Playback", TapeController :: exec, this, (void *)MENU_C2N_RESUME));
	else
		item_list.append(new Action("Pause Tape Playback", TapeController :: exec, this, (void *)MENU_C2N_PAUSE));
    item_list.append(new Action("Stop Tape Playback", TapeController :: exec, this, (void *)MENU_C2N_STOP));
	return 2;
}

void TapeController :: exec(void *obj, void *param)
{
	push_event(e_object_private_cmd, obj, (int)param);
}


void TapeController :: stop()
{
	PLAYBACK_CONTROL = C2N_CLEAR_ERROR | C2N_FLUSH_FIFO;
	PLAYBACK_CONTROL = 0; // also clears sense pin
}

void TapeController :: close()
{
	if(file) {
		printf("Closing tape file..\n");
        fclose(file);
	}
	file = NULL;
}
	
void TapeController :: start(int playout_pin)
{
	printf("Start Tape.. Status = %b. [", PLAYBACK_STATUS);
	PLAYBACK_CONTROL = C2N_CLEAR_ERROR | C2N_FLUSH_FIFO;
	PLAYBACK_CONTROL = 0;
	paused = 0;
	
	for(int i=0;i<16;i++) { // preload some blocks
		if(PLAYBACK_STATUS & C2N_STAT_FIFO_AF)
			break;
			
		read_block();
	}
	controlByte = C2N_SENSE | C2N_ENABLE | BYTE(mode << 3) | BYTE(playout_pin << 6);
	PLAYBACK_CONTROL = controlByte;
    recording = playout_pin;
	printf("] Status = %b.\n", PLAYBACK_STATUS);
}
	
void TapeController :: read_block()
{
	if(!file)
		return;
    if(ferror(file)) {
    	close();
        return;
    }
	
	UINT bytes_read;

	if(block > length)
		block = length;

	if(!block) {
        if (PLAYBACK_STATUS & C2N_STAT_FIFO_EMPTY) {
            wait_ms(400);
            close();
            if (recording) {
                push_event(e_freeze);
            }
        }
		return;
	}	
	bytes_read = fread(blockBuffer, 1, block, file);
	for(int i=0;i<bytes_read;i++)// not sure if memcpy copies the bytes in the right order.
		*PLAYBACK_DATA = blockBuffer[i];

	printf(".");
	length -= bytes_read;
	block = 512;
}
	
void TapeController :: poll(Event &e)
{
	if(!file)
		return;
	// Maybe we should catch the event here to close the file?
	if(ferror(file)) {
    	close();
        return;
    }
	
	if(e.type == e_object_private_cmd) {
		if(e.object == this) {
			switch(e.param) {
				case MENU_C2N_PAUSE:
					PLAYBACK_CONTROL = (controlByte & ~C2N_ENABLE);
					paused = 1;
					break;
				case MENU_C2N_RESUME:
					PLAYBACK_CONTROL = controlByte;
					paused = 0;
					break;
                case MENU_C2N_STATUS:
                    printf("Tape status = %b\n", PLAYBACK_STATUS);
                    break;
                case MENU_C2N_STOP:
                    close();
                	stop();
                    break;
				default:
					break;
			}
		}
	}
		
	BYTE st = PLAYBACK_STATUS;
	if(st & C2N_STAT_ENABLED) { // we are enabled
		if(!(st & C2N_STAT_FIFO_AF)) {
			read_block();
		}
	}
}
	
void TapeController :: set_file(FILE *f, DWORD len, int m)
{
    file = f;
	length = len;
	block = 512 - 20;
	mode = m; 
}
		
