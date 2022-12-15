# Answers
### Question 1 : How did you test your pipelines?

**Answer** : Docker container was used to run the Jenkins for this assignment, this was convenient in case if Pipelines went wrong then it can be undone easily. Please see how to [Build and Run the Jenkins instance using docker for this project](https://github.com/nouman-hunza/pipelines/blob/main/README.md#build-and-run-jenkins).

[Replay Pipeline](https://www.cloudbees.com/blog/replay-pipeline) was used to update and test the Jenkinsfile without actually committing the Jenkinsfile to git. That saves lots of time.

[IntelliJ Plugin](https://plugins.jetbrains.com/plugin/15699-jenkins-pipeline-linter) was used to do local linting of Jenkinsfile in the IntelliJ IDE.

### Question 2 : How did you test repoC Python?

**Answer** : repoC has a python file [parser_tests.py](https://github.com/nouman-hunza/repoC/blob/main/parser_tests.py). This files has 6 tests in it (3 unit and 3 integration tests). These are written using python module ```unitest```. Tests can be run ```python parser_tests.py```. If any of the test failed it fail the build automatically.

### Question 3 : What is the advantage of using git-lfs?

**Answer** : Git LFS is an open source project that allow to store large files in a separate lfs server while storing only the reference of the files in actual git repository. This gives the following advantages.

*  Provides the ability to version large files and also the binary files.
*  Give more space on github repository. LFS storage makes it easy to keep repository at a manageable size.
*  You can lazily load the lfs file in git client easily.
*  git standard operations are lot quicker, like clone, checkout, push ...

### Question 4 : How to adjust this repository to support LFS?

**Answer** : You first need to install git-lfs by using the comman ```git lfs install```

Then we need to track the files / directory using ```git lfs track files_expressions```, in our case as we need to lfs whole doc dirctory, we can use `git lfs track "doc/**"`

Alternative we can directly write a .gitattributes file at the root of repository and add entry like ```doc/** filter=lfs diff=lfs merge=lfs -text```.

Track all files including .gitattributes file, commit and push.

**Alternatives**

  * Some of the git lfs alternatives are listed [here](https://stackshare.io/git-lfs/alternatives#:~:text=pre%2Dcommit%2C%20Git%20Flow%2C,and%20competitors%20to%20Git%20LFS.)

  * Manage releases using ```github release``` feature is the best approach.
  
  * An artifactory should be used for build output / artifacts.

  * github hooks might be used to point the reference of large file in git and upload / download actual file when hooks trigger, like ```post-checkout``` and ```pre-commit```

