# hncr-cli

A Hacker News command line client written in Crystal

## Building

```shell
% crystal build src/hncr-cli.cr --release
```

## Usage

###### NOTE:
The client returns items concurrently.

```shell
# Print eight items from the 'new' category
% ./hncr -i new -c 8
```

### Options
 * `-i TYPE`, `--item=TYPE` The type of item (default: best).
 * `-c NUMBER`, `--count=NUMBER` The number of stories (default: 5).