#ifndef USERINTERFACE_H
#define USERINTERFACE_H

#include <stdlib.h>
#include <string.h>
#include "integer.h"
#include "screen.h"
#include "host.h"
#include "keyboard.h"
#include "path.h"
#include "poll.h"
#include "event.h"
#include "versions.h"
#include "config.h"


#define NUM_BUTTONS 5

#define BUTTON_OK     0x01
#define BUTTON_YES    0x02
#define BUTTON_NO     0x04
#define BUTTON_ALL    0x08
#define BUTTON_CANCEL 0x10

#define MAX_SEARCH_LEN 32
#define MAX_UI_OBJECTS  8


typedef enum {
    ui_idle,
    ui_host_owned,
    ui_host_permanent
} t_ui_state;

class UIObject;
class UIStatusBox;

class UserInterface : public ConfigurableObject
{
private:
    /* Configurable Object */
    void effectuate_settings(void);

    bool initialized;
    t_ui_state state;

    UIObject *ui_objects[MAX_UI_OBJECTS];
    
    void set_screen_title(void);
    CachedTreeNode *current_path;
    UIStatusBox *status_box;
public:
    int color_border, color_bg, color_fg, color_sel;

    GenericHost *host;
    Keyboard *keyboard;
    Screen *screen;
    int     focus;

    UserInterface();
    virtual ~UserInterface();

    virtual bool is_available(void);
    virtual void handle_event(Event &e);
    virtual int  popup(char *msg, BYTE flags); // blocking
    virtual int  string_box(char *msg, char *buffer, int maxlen); // blocking

    virtual void show_progress(char *msg, int steps); // not blocking
    virtual void update_progress(char *msg, int steps); // not blocking
    virtual void hide_progress(void); // not blocking (of course)

    void init(GenericHost *h, Keyboard *k);
    void set_screen(Screen *s); /* Only used in updater */
    int  activate_uiobject(UIObject *obj);
        
    void run_editor(char *);

//    UIObject *get_current_ui_object(void) { return ui_objects[focus]; }
    UIObject *get_root_object(void) { return ui_objects[0]; }
};

class UIObject
{
public:
    UIObject() { }
    virtual ~UIObject() { } 
    
    virtual void init(Screen *scr, Keyboard *key) { }
    virtual void deinit(void) { }
    virtual int  poll(int, Event &e)
    {
        return -1;
    }
//    virtual int redraw(void);
};

class UIPopup : public UIObject
{
private:
    string   message;
    BYTE buttons;

    BYTE button_key[NUM_BUTTONS];
    int  btns_active;
    int  active_button;
    int  button_start_x;
    Screen  *window;
    Keyboard *keyboard;

    void draw_buttons();

public:
    UIPopup(char *msg, BYTE flags);
    ~UIPopup() { }
    
    void init(Screen *screen, Keyboard *keyb);
    void deinit(void);
    int  poll(int, Event &e);
};
        
class UIStringBox : public UIObject
{
private:
    string    message;
    Screen   *window;
    Keyboard *keyboard;

    int   cur;
    int   len;

    // destination
    int   max_len;
    char *buffer;
public:    
    UIStringBox(char *msg, char *buf, int max);
    ~UIStringBox() { }

    void init(Screen *screen, Keyboard *keyb);
    void deinit(void);
    int  poll(int, Event &e);
};

class UIStatusBox : public UIObject
{
private:
    string   message;
    int      total_steps;
    int      progress;
    Screen  *window;
public:
    UIStatusBox(char *msg, int steps);
    ~UIStatusBox() { }
    
    void init(Screen *screen);
    void deinit(void);
    void update(char *msg, int steps);
};

void poll_user_interface(Event &e);
extern UserInterface *user_interface;

#endif