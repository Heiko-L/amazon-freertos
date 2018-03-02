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

#
# Functions that need to be defined extern
#

if (configSUPPORT_STATIC_ALLOCATION)
	set(EXTERN_vApplicationGetIdleTaskMemory "extern void vApplicationGetIdleTaskMemory( StaticTask_t **ppxIdleTaskTCBBuffer, StackType_t **ppxIdleTaskStackBuffer, uint32_t *pulIdleTaskStackSize );" CACHE INTERNAL "")
	if (configUSE_TIMERS)
		set(EXTERN_vApplicationGetTimerTaskMemory "extern void vApplicationGetTimerTaskMemory( StaticTask_t **ppxTimerTaskTCBBuffer, StackType_t **ppxTimerTaskStackBuffer, uint32_t *pulTimerTaskStackSize );" CACHE INTERNAL "")
	endif (configUSE_TIMERS)
else (configSUPPORT_STATIC_ALLOCATION)
	unset(EXTERN_vApplicationGetIdleTaskMemory CACHE)
	unset(EXTERN_vApplicationGetTimerTaskMemory CACHE)
endif(configSUPPORT_STATIC_ALLOCATION)

if (configAPPLICATION_ALLOCATED_HEAP)
	set(EXTERN_ucHeap "extern uint8_t ucHeap[];" CACHE INTERNAL "")
else (configAPPLICATION_ALLOCATED_HEAP)
	unset(EXTERN_ucHeap CACHE)
endif(configAPPLICATION_ALLOCATED_HEAP)

if (configUSE_IDLE_HOOK)
	set(EXTERN_vApplicationIdleHook "extern void vApplicationIdleHook( void );" CACHE INTERNAL "")
else (configUSE_IDLE_HOOK)
	unset(EXTERN_vApplicationIdleHook CACHE)
endif(configUSE_IDLE_HOOK)

if (configUSE_TICK_HOOK)
	set(EXTERN_vApplicationTickHook "extern void vApplicationTickHook( void );" CACHE INTERNAL "")
else (configUSE_TICK_HOOK)
	unset(EXTERN_vApplicationTickHook CACHE)
endif(configUSE_TICK_HOOK)

if (configCHECK_FOR_STACK_OVERFLOW GREATER 0)
	set(EXTERN_vApplicationStackOverflowHook "extern void vApplicationStackOverflowHook( TaskHandle_t xTask, signed char *pcTaskName );" CACHE INTERNAL "")
else (configCHECK_FOR_STACK_OVERFLOW GREATER 0)
	unset(EXTERN_vApplicationStackOverflowHook CACHE)
endif (configCHECK_FOR_STACK_OVERFLOW GREATER 0)

if (configUSE_MALLOC_FAILED_HOOK)
	set(EXTERN_vApplicationMallocFailedHook "extern void vApplicationMallocFailedHook( void );" CACHE INTERNAL "")
else (configUSE_MALLOC_FAILED_HOOK)
	unset(EXTERN_vApplicationMallocFailedHook CACHE)
endif(configUSE_MALLOC_FAILED_HOOK)

if (configUSE_DAEMON_TASK_STARTUP_HOOK)
	set(EXTERN_vApplicationDaemonTaskStartupHook "extern void vApplicationDaemonTaskStartupHook( void );" CACHE INTERNAL "")
else (configUSE_DAEMON_TASK_STARTUP_HOOK)
	unset(EXTERN_vApplicationDaemonTaskStartupHook CACHE)
endif(configUSE_DAEMON_TASK_STARTUP_HOOK)
