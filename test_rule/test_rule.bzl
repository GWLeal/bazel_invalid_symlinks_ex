def _symlink_test_rule_impl(ctx):
    link = ctx.actions.declare_symlink("invalid_symlink")

    args = ctx.actions.args()
    args.add(link.path)

    ctx.actions.run(
        arguments = [args],
        outputs = [link],
        executable = ctx.executable._create_symlink_script,
    )

    return DefaultInfo(files = depset([link]))

symlink_test_rule = rule(
    implementation = _symlink_test_rule_impl,
    attrs = {
        "_create_symlink_script": attr.label(
            cfg = "exec",
            default = "//test:create_symlinks",
            executable = True,
        ),
    },
)

def _dir_symlink_test_rule_impl(ctx):
    _dir = ctx.actions.declare_directory("invalid_symlink_dir")

    args = ctx.actions.args()
    args.add(_dir.path + "/invalid_symlink")
    args.add(_dir.path)

    ctx.actions.run(
        arguments = [args],
        outputs = [_dir],
        executable = ctx.executable._create_symlink_script,
    )

    return DefaultInfo(files = depset([_dir]))

dir_symlink_test_rule = rule(
    implementation = _dir_symlink_test_rule_impl,
    attrs = {
        "_create_symlink_script": attr.label(
            cfg = "exec",
            default = "//test:create_symlinks",
            executable = True,
        ),
    },
)
