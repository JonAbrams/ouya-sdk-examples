/*
 * Copyright (C) 2012, 2013 OUYA, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package tv.ouya.sdk.monogame;


import android.util.Log;


public class AsyncCppOuyaSetApplicationKey {

	static final String LOG_TAG = "AsyncCppOuyaSetApplicationKey";

	public static void invoke(byte[] applicationKey) {
		Log.i(LOG_TAG, "invoke");
		
		try {
			MonoGameOuyaPlugin.SetApplicationKey(applicationKey);
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}