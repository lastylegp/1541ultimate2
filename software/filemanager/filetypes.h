/*
 * filetypes.h
 *
 *  Created on: Apr 25, 2015
 *      Author: Gideon
 */

#ifndef FILEMANAGER_FILETYPES_H_
#define FILEMANAGER_FILETYPES_H_

#include "factory.h"
#include "action.h"
#include "cached_tree_node.h"

class FileSystem;

class FileType
{
public:
	FileType() { }
	virtual ~FileType() { }

	virtual FileSystem *getFileSystem() { return NULL; }
	virtual int fetch_context_items(IndexedList<Action *> &list) {
		return 0;
	}

};

extern Factory<CachedTreeNode *, FileType *> file_type_factory;

#endif /* FILEMANAGER_FILETYPES_H_ */
