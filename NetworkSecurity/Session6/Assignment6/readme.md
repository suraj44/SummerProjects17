STEP 1:

Goto https://github.com/IEEE-NITK/SummerProjects17 and fork the repo to your account. There is a fork button on the top right.

STEP 2:

Open the forked repository in your own account at

https://github.com/your-username/SummerProjects17

Or simply navigate to it insde your profile.

STEP 3:

Click on Clone or Download and copy the clone URL.

STEP 4:

In your terminal (git bash in windows) type

git clone <paste-url>

STEP 5:

Enter the cloned directory by typing cd "DirectoryName". Type ls to list its contents.

STEP 6:

Type git remote -v. This should display the url to your local repo on github for fetch and push.

STEP 7:

Type

git remote add upstream git://github.com/IEEE-NITK/SummerProjects17

STEP 8:

Enter git remote -v now and you should see two additional upstream links added.

STEP 9:

Enter git pull upstream master. This should pull all the latest files.

STEP 10:

Navigate to NetworkSecurity/Session6/Assignment6 and create a folder with its name as your name

STEP 11:
 
Inside your folder, add your assignment file

git add filename

git commit -m "Short description of changes"

git push origin master

STEP 12:

Go to your forked repo in your github account. You should see your changes updated. Click on Pull Request and send a pull request to update your changes.

STEP 13:

Once your Pull Request is merged, it will be added to the main repo. Doing git pull upstream master will now update your repo with everyones submissions.

