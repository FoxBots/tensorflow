This Tensorflow fork downgrades the used protobuf version to 3.3.2 so it can be
linked against another binary with a hard dependency on that version. It is
forked from v1.5.0 and has the following changes:

  1. Changes the (3!) protobuf repositories in tensorflow/worskpace.bzl to point
     to version 3.3.2.

  1. Removes the existing no_inline patch.

  1. Adds a new patch that fixes a bug specific to protobuf 3.3.2 and Bazel.

See the git log for the exact changes.
