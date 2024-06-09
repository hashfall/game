const std = @import("std");
const r = @cImport(
    @cInclude("raylib.h"),
);

pub fn main() !void {
    const screenWidth = 800;
    const screenHeight = 450;

    r.InitWindow(screenWidth, screenHeight, "raylib [code] - maybe smol game");

    r.SetTargetFPS(60);

    while (!r.WindowShouldClose()) {
        r.BeginDrawing();
        r.ClearBackground(r.RAYWHITE);
        r.DrawText("The very first raylib window", 190, 200, 20, r.LIGHTGRAY);
        r.EndDrawing();
    }

    r.CloseWindow();
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
