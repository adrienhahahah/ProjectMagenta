# Project Magenta

## What is it?

Project Magenta is a fork of [TWBlue](http://twblue.es) with enhancements. TWBlue changes are frequently merged in, and bug fixes are occasionally sent upstream.

## Is Project Magenta stable?

Project Magenta merges changes from the next-gen branch of TWBlue. This means that new features and bug fixes can be pushed as quickly as possible. This also means that bugs can (and will) pop up and features, translations, or documentation may not be complete. It should be stable enough for daily use, but [it is provided "as is"](http://www.gnu.org/licenses/gpl-3.0.en.html).

## Which platforms are supported?

Windows is fully supported, and Gnu/Linux support is under development. OS X cannot be supported because WXPython does not work with VoiceOver.

## How can I build it?

See the [TWBlue readme](http://github.com/manuelcortez/twblue).

## Are binary distributions available?

Yes! See [the Project Magenta website](http://n6.io/magenta).
## What's with the version numbers?

Suppose the current Project Magenta version is x.y.z:

*   x represents the master TWBlue version since Project Magenta's release. Project Magenta was released when no next-gen master build was available, so the initial release x was 0\. At the current pace of upstream development, it'll probably stay 0 for a while.
*   y represents pulls from the upstream repository since the last x version bump. First version was 1, since we only pulled once from upstream.
*   z represents Project Magenta specific changes made since the last y version bump. Initially 1, since one set of changes was made since pulling.