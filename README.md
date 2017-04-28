ImageMagick-et
==============

This is a custom branch of ImageMagick meant to build version 6.9 on an Ubuntu 14.04 machine and install in `/opt/ImageMagick-6`.

New commits to the `evertrue/dev` branch are [automatically built by Jenkins](https://ci.evertrue.com/job/ImageMagick-debian/) and deployed to the [EverTrue package repository](https://console.aws.amazon.com/s3/home?region=us-east-1&bucket=ops.evertrue.com&prefix=debian-repo/) in S3.

Key Modifications
=================

* `debian/changelog` - Used to set the package version and describe updates
* `debian/control` - Package description and dependency set listing
* `debian/jenkins-built` - The main shell script that Jenkins runs to do the build

Building With Docker
====================

```
docker run -v '/var/lib/jenkins:/signingkeys'
```
