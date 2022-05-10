load("//test_rule:test_rule.bzl", "symlink_test_rule", "dir_symlink_test_rule")

sh_binary(
    name = "create_symlinks",
    srcs = ["create_symlink.sh"],
)

symlink_test_rule(
    name = "symlink_test",
)

dir_symlink_test_rule(
    name = "dir_symlink_test",
)
