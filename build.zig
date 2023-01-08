const std = @import("std");

const Pkgs = struct {
    const ulid = std.build.Pkg{
        .name = "ulid",
        .path = . { .path = "./deps/ulid-zig/ulid.zig" },
    };
};

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();

    const static = b.addStaticLibrary("ulid", "src/ulid.zig");
    static.setBuildMode(mode);
    static.addPackage(Pkgs.ulid);
    static.linkLibC();
    static.install();

    const shared = b.addSharedLibrary("ulid", "src/ulid.zig", .unversioned);
    shared.setBuildMode(mode);
    shared.addPackage(Pkgs.ulid);
    shared.linkLibC();
    shared.install();

    const main_tests = b.addTest("src/ulid.zig");
    main_tests.setBuildMode(mode);
    main_tests.addPackage(Pkgs.ulid);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
