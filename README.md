cs-studio-SNS
=============

`NOTE:`
This repository was used for building the SNS specific version of CS-Studio based on Eclipse.
In May 2019, SNS stopped working on the Eclipse-based CS-Studio
and instead concentrated on the newer Phoebus-based CS-Studio,
which offers several advantages, including a much simplified and faster build mechanism.

See https://github.com/kasemir/phoebus-sns for the Phoebus-based replacement
of this repository,
https://controlssoftware.sns.ornl.gov/css_phoebus/ for binaries,
https://github.com/ControlSystemStudio/phoebus for the common Phoebus repo.


Example for compiling the SNS products
--------------------------------------

 1) Somewhere on your computer, execute what's in build/get_all.sh .
    As a result, you should have a directory with these sub-dirs:

    diirt
    maven-osgi-bundles
    cs-studio-thirdparty
    cs-studio
    org.csstudio.display.builder
    org.csstudio.sns

 2) `cd org.csstudio.sns/build`
 
 3) Edit the file `setup.sh` to define your `JAVA_HOME` and `M2_HOME`
 
 4) `sh make.sh`
   Note that this build setup is self-contained.
   You can start out without any `~/.m2` directory,
   in fact you may want to delete an existing org.csstudio.display.builder
   to assert a clean plate.
   Maven is invoked with the `settings.xml` from `org.csstudio.sns/build`,
   which in turn enable a composite repository from `org.csstudio.sns/css_repo`
   that is configured as the combination of all the repositories that
   we are about to build locally: diirt, maven-osgi-bundles, etc.

As a result, you should find log files for the various build steps in the original directory:
`0_diirt.log`, `1_maven-osgi-bundles.log`, `2_cs-studio-thirdparty.log`, `3_core.log`, `4_applications.log`, `5_display_builder.log`, `6_sns.log`.

The directory `org.csstudio.sns/repository/target/products` will contain the binary products.
One of the UI product's /plugin folder can be used as a target platform for the Eclipse IDE.
`org.csstudio.sns/repository/target/repository` is a P2 repository from which the UI product
can install optional features.
