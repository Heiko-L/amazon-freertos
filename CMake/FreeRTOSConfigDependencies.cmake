#
# Take care of timers.c
#

if (INCLUDE_xTimerPendFunctionCall)
	set(configUSE_TIMERS ON CACHE BOOL "" FORCE)
endif(INCLUDE_xTimerPendFunctionCall)

if (configUSE_TIMERS)
	set(Compile_Timers ON CACHE BOOL "" FORCE)
	set(Compile_Queue ON CACHE BOOL "" FORCE)
	set(configTIMER_TASK_STACK_DEPTH "configMINIMAL_STACK_SIZE" CACHE STRING "" FORCE)
	set(configTIMER_QUEUE_LENGTH "1" CACHE STRING "" FORCE)
endif(configUSE_TIMERS)

if (configTIMER_TASK_STACK_DEPTH STRGREATER "0")
	set(configUSE_TIMERS ON CACHE BOOL "" FORCE)
	set(Compile_Timers ON CACHE BOOL "" FORCE)
else(configTIMER_TASK_STACK_DEPTH STRGREATER "0")
	set(configUSE_TIMERS OFF CACHE BOOL "" FORCE)
	set(Compile_Timers OFF CACHE BOOL "" FORCE)
endif(configTIMER_TASK_STACK_DEPTH STRGREATER "0")

#
# Take care of queue.c
#

if (configUSE_QUEUE_SETS)
	set(Compile_Queue ON CACHE BOOL "" FORCE)
endif(configUSE_QUEUE_SETS)

#
# event_groups.c
#

if (INCLUDE_xEventGroupSetBitFromISR)
	set(Compile_EventGroups ON CACHE BOOL "" FORCE)
endif(INCLUDE_xEventGroupSetBitFromISR)
