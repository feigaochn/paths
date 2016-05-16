[![Build Status][travis-badge]][travis-link]
[![Slack Room][slack-badge]][slack-link]

# Paths

Create or append to environment variables.

## Install

With [fisherman]

```
fisher paths
```

## Usage

```fish
echo VALUE > ~/.config/fish/paths.d/KEY_NAME
```
or
```fish
printf "%s\n" VALUE1 VALUE2 > ~/.config/fish/paths.d/KEY_NAME
```


## Example

Set [GOPATH](https://github.com/golang/go/wiki/GOPATH).

```fish
echo ~/go > ~/.config/fish/paths.d/GOPATH
```

Restart any open terminal sessions for the change to take effect.

```
echo $GOPATH
/home/user/go
```

[travis-link]: https://travis-ci.org/fisherman/paths
[travis-badge]: https://img.shields.io/travis/fisherman/paths.svg
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[fisherman]: https://github.com/fisherman/fisherman
