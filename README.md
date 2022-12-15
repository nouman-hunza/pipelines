# Pipeline

This project contains Jenkins declarative pipeline as Jenkinsfile. The pipeline does the following.
* Clone the git repo from ```https://github.com/nouman-hunza/repoA.git``` which is fork of ```https://github.com/grpc/grpc```
* Create doxygen config file and update the following default properties.

  *  INPUT = src            (set the input source folder where doxygen scan for files)
  *  RECURSIVE = YES        (scand source folder recursively for sub directories)
  *  GENERATE_HTML = YES    (generate doxygen output as HTML, this will create a directory containing main index.html file to view generated docs)

* Run doxygen with the config file created through last step.
* Tar the html directory to doc.tar.gz file
* Archive the tar file using Jenkins archive plugin.
