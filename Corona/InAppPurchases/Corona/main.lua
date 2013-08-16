-- Copyright (C) 2012, 2013 OUYA, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local DEVELOPER_ID = "310a8f51-4d6e-4ae5-bda0-b93878e5f5d0";

globals = require "globals"
helpers = require "helpers"
inputs = require "inputs"
ui = require "ui"

if nil ~= myTests then
	print ("LUA ouyaSetDeveloperId (" .. DEVELOPER_ID .. ")");
	myTests.ouyaSetDeveloperId(DEVELOPER_ID);
end

globals.centerX = display.contentCenterX;

globals.txtHello = display.newText("Hello from Corona SDK", globals.centerX - 500, 200, "Helvetica", 24);
globals.txtStatus = display.newText("", globals.centerX, 200, "Helvetica", 24);
globals.txtGamerUUID = display.newText("Gamer UUID: (unknown)", globals.centerX - 300, 240, "Helvetica", 24);
globals.txtInstructions = display.newText("Use DPAD to switch between buttons | Press O to click the button", globals.centerX - 300, 325, "Helvetica", 24);

globals.btnProducts = helpers.createButton(globals.centerX - 400, 400, 1.5, 0.5, "Get Products", -70, -25, 24);
globals.btnPurchase = helpers.createButton(globals.centerX - 175, 400, 1.75, 0.5, "Request Purchase", -100, -25, 24);
globals.btnReceipts = helpers.createButton(globals.centerX + 50, 400, 1.5, 0.5, "Get Receipts", -70, -25, 24);
globals.btnFetch = helpers.createButton(globals.centerX + 275, 400, 1.75, 0.5, "Fetch Gamer UUID", -100, -25, 24);
globals.btnPause = helpers.createButton(globals.centerX + 450, 400, 0.75, 0.5, "Pause", -35, -25, 24);

globals.btnProducts.btnRight = globals.btnPurchase;
globals.btnPurchase.btnLeft = globals.btnProducts;
globals.btnPurchase.btnRight = globals.btnReceipts;
globals.btnReceipts.btnLeft = globals.btnPurchase;
globals.btnReceipts.btnRight = globals.btnFetch;
globals.btnFetch.btnLeft = globals.btnReceipts;
globals.btnPause.btnLeft = globals.btnFetch;

ui.setButtonFocus (globals.btnProducts);

-- Add the key event listener.
Runtime:addEventListener( "key", inputs.onKeyEvent )