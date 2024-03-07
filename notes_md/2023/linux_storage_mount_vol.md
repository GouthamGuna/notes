# Linux Formatting & Mounting Storage Volumes

	- lsblk ('to list all of the block devices are attached to my computer')
	
	- ls -l /dev/<sda> ('<sda> || <sdb> is a root disk')
	
# Boot Device 

	- sudo fdisk -l

		- ('If you have an nvme disk now the lsblk commamd is not the only cmd that we can use to see what partitions are available on storage device.
		    we can use the fdisk cmd for that as well so for ex : sudo fdisk -l ('-l information listing for the storage devices')
		  ')
	    
	- mount
	
		- List all of the mounted storage device on the system
		
	- mount | grep sdb
	
	- sudo umount /<path-name> (or) sudo umount /<sdb>
	
		- ('Which means that the device is no longer mounted and check ('mount | grep sbd') nothing is showing')
		
# Create New Partition Table

	- sudo fdisk /dev/<sdb>
