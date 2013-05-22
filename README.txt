Welcome to Legend!

Please read through this entire README file before starting to use GIT (even if this is not your first time using it).

For your ease of access to information, each section of this document will have horizontal lines above and below the title of the section and the title will have roman numerals to indicate its number in the section. There will also be a horizontal line below the section. Each section will have two lines of white space inbetween the next section and itself.

--------------------
I. Table of Contents
--------------------
		I.		Table of Contents
		II.		Using GIT - Basics
		III.	Using GIT - Branching
		IV.		Using Files
		V.		Protocol
--------------------


--------------------
II. Using GIT - Basics
--------------------
		Our Company's official GIT client is SmartGit. It is required that all developers in the company use the official GIT client.
		
			*NOTE: For all file related tasks, please read chapter 'IV. Using Files' before actually working with files.*
			
			For editing a file (or files):
					- Create a new local branch and switch to it (See chapter 'III. Using GIT - Branching' for information on how to create a branch and see chapter 'V. Protocol' for branch naming conventions). If multiple people will be working on your file(s), commit and push the branch before making any edits to file(s).
					
					- Open the file you want to edit in the program of your choice (it is easier if you use a file explorer rather than your GIT client to open the file).
						o *NOTE: Make sure you are switched to the new branch before opening the file (See chapter 'III. Using GIT - Branching')!*
					
					- Edit the file(s).
					
					- Commit the changes (See chapter 'V. Protocol'). DO NOT PUSH!
					
					- If and ONLY IF multiple people are working on your file(s) (i.e. you pushed the branch before making changes to the file(s)) then push the changes.
					
					- If/When you are happy with your changes (e.g. they achieve the desired result while not breaking anything) then switch back to the Master branch
					
					- Merge the changes from the new branch to the Master branch.
					
					- Commit and push the changes from the Master branch.
			
			For creating a file (or files):
					- Confirm that you are in the Master branch.
			
					- Create the file, but leave it in its default state (e.g. no text in a text file; the simple cube, light, and camera in a blender file; etc).
					
					- Save the file as whatever name is appropriate in whatever folders you need it in (see chapters 'IV. Using Files' and 'V. Protocol').
					
					- Commit the file (See chapter 'V. Protocol' for commit message protocol).
					
					- Push the changes to the Master branch.
					
					- For editing the file, refer to the section above.
			
			For deleting a file (or files):
					- Create a new branch (see chapter 'IV. Protocol' for branch naming conventions)
					
					- Delete the file from your local branch.
					
					- Test to make sure everything runs smoothly.
					
					- Commit and push the branch (See chapter 'V. Protocol' for commit message protocol). DO NOT MERGE!
					
					- Inform Kenan Millet of the new branch. He will merge the branch as soon as everyone is informed of the changes.
--------------------


--------------------
III. Using GIT - Branching
--------------------
		Branching can be explained through the following scenario:
			You have a branch (it may just be the Master branch), in which all the files and folders are named certain things and behave in certain ways. You want to add/change a file/folder or group of files/folders, but if something was to go wrong, you want the ability to go back to before you added/changed anything. So you create a new branch and 'switch' to it (explained below). This new branch is a direct copy of the previous branch (by default) and it has its own "timeline" of sorts. Any changes you make in this branch do not affect the other branch. If you mess up and want to revert, you can easily 'switch' back to the other branch and delete the new one. If you are happy with your changes, you can 'merge' the new branch into the old one and now the old one has the new changes as well.
			
		In short, branching is the act of creating branches. These branches are used to bookmark various points in time to revert back to in case of a problem.
		
		Although there are some exeptions, most branches will be created from and merged into the Master branch.
		
		Below is a guide as to when and why a branch should be created/not created and what branch you should be in at any given time.
		
			When to create a branch:
				- [Development Branch] You are going to be making changes to a file(s).
					o Subdevelopment branches should be created if the development is happening on a rather large or complex scale
			
				- [Deletion Branch] You are going to be deleting a file(s)/folder(s).
			
			
			When NOT to create a branch:
				- You are going to be creating a file(s)/folder(s).
				
				
			What branch to be in at any given time:
				- Master branch:
					o You are creating files/folders.
					o You are looking at merges others have made
					o You are playtesting the entire game (not to be confused with playtesting something you are working on)
					
				- Development branch/Subdevelopment Branch (see below for branch naming):
					o You are making changes to a file(s).
					
				- Deletion branch(has the word 'Delete' in it)
					o You are making deleting a file(s)/folder(s).
			
		Switching to a branch is how you access files and folders from that branch. When you switch to a branch, GIT will PHYSICALLY delete, create, and make changes to files and folders on your ACTUAL computer. GIT will only touch the folder containing your local repository. To switch to a branch, right click the branch in your local branches section and click 'Switch Branch'. If you want to switch to a branch on the remote repository, do the same, but the branches will be located in your 'origin' section. When switching to a remote branch, if the branch does not already exist in your local repository, you have the option to create it. If it does exist, hit the read only option.
		
		Merging into a branch is how you bring the changes you made in one branch into another branch. To merge, switch to the branch that you want another branch to be merged into, then click Merge. You will then have the option to select what branches to merge into the branch you are currently in. It should be noted that Subdevelopment branches should only be merged into their corresponding development branch.
--------------------


--------------------
IV. Using Files
--------------------
		Our company uses 'Link Shell Extension' to aid in the use and editing of most game related files ( Download: http://schinagl.priv.at/nt/hardlinkshellext/hardlinkshellext.html#download ). Although it is not required, it is highly reccomended that you use this program to aid in creating Hardlinks and Junctions - something you will have to do whenever using or editing most game related files. Any tutorials covered in this section of the README will assume that you have Link Shell Extension installed on your computer.
		
		In order to use or edit a game related file, you may need to link the file to another location on your computer (other than your local repository). Even if you don't need to, it is still simpler to use or edit the file if it is not being edited inside your local repository. In order to do this, we will need to establish at least one of two things: Junctions and Hardlinks.
		
		*NOTE: Without Link Shell Extension, the Junctions and Hardlinks mentioned below will need to be created through command prompt.*
		
		*NOTE: Read the ENTIRE tutorial below (the rest of the chapter) before attempting this yourself.*
		
			Open up your local repository in a file explorer window. Right click the file you want to edit and click 'Pick Link Source'. Navigate to the location where you want to establish the link (where you want the file to be), right click, and click 'Drop As...' > 'Hardlink'. You have now created a Hardlink between the file in your repository and the location somewhere else on your computer. This means that when a program opens a file (for use or edit) it will think it is opening the file in the location you specified, but is actually opening it in the repository. When the program saves the file (if editing), it will actually be saving to the repository as well.
			
			If there are many files you want to link, you can use a Junction to instead link the folder that contains them. To do this, right click the containing folder in your local repository and click 'Pick Link Source'. Navigate to the location where you want to establish the link (where you want the folder to be), right click, and click 'Drop As...' > 'Junction'. You have now created a Junction between the containing folder in your repository and the location somewhere else on your computer. This means that when a program tries to open the containing folder as a directory so that it can open a file inside (for use or edit), it will think it is opening the folder in the location you specified, but is actually opening it in the repository. When the program saves a file inside of that folder (if editing), it will actually be saving it to the containing folder in the repository. This means that if you create a file and save it to that folder, it will be automatically placed in the same folder in your repository.
			
			The use of Junctions and Hardlinks is so that you may open/edit/use files outside of the repository, but save them inside the repository.
			
			There are rules that you need to follow when using junctions/hardlinks. When looking at a file in your GIT client, you can look at its commit messages to see if you should create a Hardlink for it, or create a Junction for its containing folder. Usually this is stated in the first commit, but sometimes it is changed in later commit messages. If it is not stated, or if you are looking for what to put in your own commit message (also see chapter 'V. Protocol'), refer to the following guide:
				- Hardlink
					o You want the file to be opened from somewhere else, but saved to the location which it is hardlinked from.
					
				- Junction (the answers to all of the following must be 'yes' in order to use a Junction)
					o Every file inside of the folder you are creating a Junction for is intended to be Hardlinked
					o Any file added to the Junction is intended to be Hardlinked automatically
					o If the folder you are Junctioning exists in the location you intend to Junction it to
						- The folder does not contain any files that are not in the corresponding folder in the repository (the folder you are creating a Junction for)
--------------------


--------------------
V. Protocol
--------------------
		There is various conventions and protocol that needs to be followed when handling any files related to the game. If said protocol/conventions are not stated above, they will be stated here.
		
		For naming Branches:
			- Development Branches/ Subdevelopment Branches| 'Develop' + '--' + <Intended Branch to Merge to> + '-' + <Branch Name>
				o Example 1| Develop--Master-MyBranch
				o Example 2| Develop--Master-MyBranch
				o Example 3 (for Subdevelopment Branches)| Develop--MyBranch-MySubBranch
			
			- Deletion Branches| 'Delete' + '--' + <Intended Branch to Merge to> + '-' + <Branch Name>
				o Example 1| Delete--Master-MyBranch
				o Example 2| Delete--Master-MyBranch
				o Example 3| Delete--MyBranch-MySubBranch
				
			- Branch and Sub-branch names should sum up the files/folders being changed in one or two words. Use CamelCase for naming branches.
				
		
		For commit messages:
			Commit messages should be as folows (the box border is unnecessary and only serves to illustrate the commit message box in the GIT client:
			
				/-----------------------------------------------------------------------------------------------------------\
				|    Files being added <only include if files are added>:                                                   |
				|      - <Intended branch for use>:<directory>.<filename or folder name>.<file extension if it is a file>   |
				|      - <same format as above>                                                                             |
				|                                                                                                           |
				|    Files being modified <only include if files are modified>:                                             |
				|      - <directory>.<filename or folder name>.<file extension if it is a file>: Summary of changes         |
				|      - <same format as above>                                                                             |
				|                                                                                                           |
				|    Files being deleted <only include if files are deleted>:                                               |
				|      - <directory>.<filename or folder name>.<file extension if it is a file>                             |
				|      - <same format as above>                                                                             |
				|                                                                                                           |
				|    Link Properties <only include if files are NOT deleted>:                                               |
				|      - <directory>.<filename or folder name>.<file extension if it is a file> <Hardlink/Junction>         |
				|      - <same format as above>                                                                             |
				\-----------------------------------------------------------------------------------------------------------/
				
		Things to Remember:
			- All commits should be done in a branch
			- Creation of files should be committed ONLY through the Master branch
			- Anything changes that do not include the creation of a file should be committed in development/deletion/subdevelopment/subdeletion branches
			- Deletion and Subdeletion branches should never be merged. Inform Kenan of the branch and he will merge it at his discretion.
			- Modification, Addition, and Deletion commits should NEVER be together as their corresponding changes should all be in their own separate branches.
--------------------