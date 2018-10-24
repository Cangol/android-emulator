FROM cangol/android-gradle
LABEL MAINTAINER Cangol  <wxw404@gmail.com>

#avdmanager create avd
RUN echo yes | $ANDROID_HOME/tools/bin/avdmanager create avd --force --name test -k  $ANDROID_IMAGES --device "Nexus 4" --sdcard 500M

RUN ${ANDROID_HOME}/tools/emulator -avd test -noaudio -no-window -gpu off &
RUN android-wait-for-emulator
