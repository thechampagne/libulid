#ifndef __ULID_H__
#define __ULID_H__

#ifdef __cplusplus
extern "C" {
#endif

extern unsigned __int128 ulid_source();

extern void ulid_to_binary(unsigned __int128 src, char* out);

extern void ulid_encode_base32(unsigned __int128 src, char* out);
  
#ifdef __cplusplus
}
#endif

#endif // __ULID_H__
