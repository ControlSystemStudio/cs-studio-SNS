if [ ! -x "$JAVA_HOME/bin/java" ]
then
    echo "Missing JAVA_HOME"
    exit 1
fi

if [ ! -x "$M2_HOME/bin/mvn" ]
then
    echo "Missing M2_HOME"
    exit 1
fi

if [ ! -d "$SRC_DIR/org.csstudio.sns/css_repo" ]
then
    echo "Missing SRC_DIR"
    exit 1
fi

MSET="`pwd`/settings.xml"
if [ ! -r $MSET ]
then
    echo "Missing maven settings"
    exit 1
fi

export M2=$M2_HOME/bin
export PATH=$M2:$JAVA_HOME/bin:$PATH

OPTS="-s $MSET --offline clean verify"
OPTS="-s $MSET clean verify"

mvn -version

sleep 5

cd ../..
TOP=`pwd`

# rm -rf ~/.m2/repository
rm -f 0_diirt.log 1_maven-osgi-bundles.log 2_cs-studio-thirdparty.log  3_core.log 4_applications.log 5_sns.log

(cd diirt; time  mvn $OPTS ) | tee 0_diirt.log

(cd maven-osgi-bundles; time  mvn $OPTS ) | tee 1_maven-osgi-bundles.log

(cd cs-studio-thirdparty; time  mvn $OPTS ) | tee 2_cs-studio-thirdparty.log

(cd cs-studio/core; time  mvn $OPTS ) | tee 3_core.log

(cd cs-studio/applications; time  mvn $OPTS ) | tee 4_applications.log

(cd org.csstudio.sns; time  mvn $OPTS ) | tee 5_sns.log

# Products now under org.csstudio.sns/repository/target/products/*
# Feature repo under org.csstudio.sns/repository/target/repository

