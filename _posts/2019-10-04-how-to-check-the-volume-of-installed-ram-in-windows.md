---
layout: post
categories:
	- how to
	- pc
tags:
	- windows
---
Sometimes, like me, you may neeed to quickly lookup the total size of physical memory (RAM) currently installed
in your PC. There are a few ways i usually get about to doing this.
+ Using the Windows DirectX Diagnostic Tool [DxDiag]
+ Using the Windows System Information Tool [MsInfo32]
Lets get started.

### Using the Windows DirectX Diagnostic Tool [DirectX]
The particular advantage i have found in the use of this particular utility is that it helps me to also 
lookup certain other hardware values and states. These include information about the system video graphics hardware 
and its drivers, the system sound hardware and its drivers and others such as the system configured input devices and such alike.

The DxDiag utility is located in the "C:/Windows/System32" folder, but its not the best to go there looking for it.
The Windows OS provides other ways to access this utility. Follow Me;
1.
>+	Bring up your windows start menu by pressing the "Windows key" on your keyboard.
 +	Type "Run" into the start menu search bar, and you should be able to locate the "Run" utility from the list of search results.
 +	Click it, to open it.
 
####Or

2. 
>+	Press the "Windows + R" keys on your keyboard.
Now that we have the run utility, type "dxdiag" into its search box and select 'Ok' to continue.

If you're doing this for the first time, this should bring a pop-up dialogue box asking if you "would like windows to check for driver signatures", 
select 'Yes'.

You should now have the Dxdiag utility tool window open in your desktop. Allow the small green bar at the 
lower left part of the window to fill up and you can check-up any information within this window that you desire.  
The total amount of installed RAM should be at the main tab along with other related infos.

### Using the Windows System Information Tool [MsInfo32]
The windows system information tool is also quite a great tool to use when there is need to look up information.
This particular tool is very useful for looking up information specific to your windows installation. 
You can also use it to check for hardware states and values. To open it we'll continue from step 2 above, right 
after we've open our "Run utility".

Within the Run utility search box type "msinfo32" and select 'Ok'. Take note of the categories at the left hand of the screen.
The active category should be the 'System Summary'. To find what you're looking for, scroll down the informations in the right hand part of the screen.
Near the end of the page you should be able to locate the 'Total Physical Memory' variable. Its value is the current volume of your installed physicall memory.

Did this post help you? you can help make it abroad by sharing it with your contacts through any of the social links below.
Or you can copy and share its url (provided below).