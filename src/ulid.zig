// Copyright (c) 2023 XXIV
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
const testing = @import("std").testing;
const ulid = @import("ulid");

export fn ulid_source() u128 {
    var generator = ulid.Ulid.new();
    const res = generator.source() catch return 0;
    return res;
}

export fn ulid_to_binary(src: u128, out: [*:0]u8) void {
    const res = ulid.to_binary(src);
    @memcpy(out, &res, res.len);
}

export fn ulid_encode_base32(src: u128, out: [*:0]u8) void {
    const res = ulid.encode_base32(src);
    @memcpy(out, &res, res.len);
}

test {
    const example = 2010743602507803096168807030878758460;
    var example_bin: [128:0]u8 = undefined;
    var example_encoded: [26:0]u8 = undefined;
    ulid_to_binary(example, &example_bin);
    ulid_encode_base32(example, &example_encoded);

    try testing.expectEqualSlices(u8, &example_bin, "00000001100000110100000101010000010010111000100101111100011101001110110010011001000010010101110011100111011111011110011000111100");
    try testing.expectEqualSlices(u8, &example_encoded, "01GD0N0JW9FHTES689BKKQVSHW");
}
