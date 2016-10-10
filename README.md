# gradle

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with gradle](#setup)
    * [What gradle affects](#what-gradle-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with gradle](#beginning-with-gradle)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Module that install and manage Gradle build system.

## Setup

### What gradle affects **OPTIONAL**

* Dependencies:
  * puppet/archive

### Beginning with gradle

```puppet
include gradle
```

If you want to install specific version use `version` parameter
```puppet
  class {'gradle':
    version => '2.14',
  }
```
