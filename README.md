# libulid

[![](https://img.shields.io/github/v/tag/thechampagne/libulid?label=version)](https://github.com/thechampagne/libulid/releases/latest) [![](https://img.shields.io/github/license/thechampagne/libulid)](https://github.com/thechampagne/libulid/blob/main/LICENSE)

Simple ULID implementation for **C**.

### Installation & Setup

#### 1. Clone the repository
```
git clone https://github.com/thechampagne/libulid.git
```
#### 2. Navigate to the root
```
cd libulid
```
#### 3. Build the project
```
zig build
```

### API

```c
unsigned __int128 ulid_source();

void ulid_to_binary(unsigned __int128 src, char* out);

void ulid_encode_base32(unsigned __int128 src, char* out);
```

### References
 - [ulid](https://github.com/kyoheiu/ulid-zig)

### License

This repo is released under the [MIT](https://github.com/thechampagne/libulid/blob/main/LICENSE).
