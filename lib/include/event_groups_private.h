/*
 * FreeRTOS Kernel V10.0.1
 * Copyright (C) 2017 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * http://www.FreeRTOS.org
 * http://aws.amazon.com/freertos
 *
 * 1 tab == 4 spaces!
 */

#ifndef EVENT_GROUPS_PRIVATE_H
#define EVENT_GROUPS_PRIVATE_H

#ifdef __cplusplus
extern "C" {
#endif
/* For internal use only. */
void vEventGroupSetBitsCallback( void *pvEventGroup, const uint32_t ulBitsToSet ) PRIVILEGED_FUNCTION;
void vEventGroupClearBitsCallback( void *pvEventGroup, const uint32_t ulBitsToClear ) PRIVILEGED_FUNCTION;


#if (configUSE_TRACE_FACILITY == 1)
	UBaseType_t uxEventGroupGetNumber( void* xEventGroup ) PRIVILEGED_FUNCTION;
	void vEventGroupSetNumber( void* xEventGroup, UBaseType_t uxEventGroupNumber ) PRIVILEGED_FUNCTION;
#endif

#ifdef __cplusplus
}
#endif

#endif /* EVENT_GROUPS_PRIVATE_H */
