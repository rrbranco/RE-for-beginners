#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <dlfcn.h>
#include <string.h>

void *libc_handle = NULL;
int (*open_ptr)(const char *, int) = NULL;
int (*close_ptr)(int) = NULL;
ssize_t (*read_ptr)(int, void*, size_t) = NULL;

bool inited = false;

_Noreturn void die (const char * fmt, ...)
{
	va_list va;
	va_start (va, fmt);

	vprintf (fmt, va);
	exit(0);
};

static void find_original_functions ()
{
	if (inited)
		return;

	libc_handle = dlopen ("libc.so.6", RTLD_LAZY);
	if (libc_handle==NULL)
		die ("can't open libc.so.6\n");

	open_ptr = dlsym (libc_handle, "open");
	if (open_ptr==NULL)
		die ("can't find open()\n");

	close_ptr = dlsym (libc_handle, "close");
	if (close_ptr==NULL)
		die ("can't find close()\n");

	read_ptr = dlsym (libc_handle, "read");
	if (read_ptr==NULL)
		die ("can't find read()\n");

	inited = true;
}

static int opened_fd=0;

int open(const char *pathname, int flags)
{
	find_original_functions();

	int fd=(*open_ptr)(pathname, flags);
	if (strcmp(pathname, "/proc/uptime")==0)
		opened_fd=fd; // that's our file! record its file descriptor
	else
		opened_fd=0;
	return fd;
};

int close(int fd)
{
	find_original_functions();

	if (fd==opened_fd)
		opened_fd=0; // the file is not opened anymore
	return (*close_ptr)(fd);
};

ssize_t read(int fd, void *buf, size_t count)
{
	find_original_functions();

	if (opened_fd!=0 && fd==opened_fd)
	{
		// that's our file!
		return snprintf (buf, count, "%d %d", 0x7fffffff, 0x7fffffff)+1;
	};
	// not our file, go to real read() function
	return (*read_ptr)(fd, buf, count);
};

