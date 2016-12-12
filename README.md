#Gradle

####Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with gradle](#setup)
    * [Beginning with gradle](#beginning-with-gradle)

##Description

The Gradle module installs and manages the Gradle build tool.

## Setup

### Beginning with gradle

`include 'gradle'` is enough to get you up and running. If you wish to pass in parameters specifying which version to use, then:

```puppet
  class {'gradle':
    version => '2.14',
  }
```
