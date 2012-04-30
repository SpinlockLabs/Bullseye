// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

#library('crypto');

#source('hmac.dart');
#source('sha_utils.dart');
#source('sha1.dart');
#source('sha256.dart');

/**
 * Interface for cryptographic hash functions.
 *
 * The [update] method is used to add data to the hash. The [digest] method
 * is used to extract the message digest.
 *
 * Once the [digest] method has been called no more data can be added using the
 * [update] method. If [update] is called after the first call to [digest] a
 * HashException is thrown.
 *
 * If multiple instances of a given Hash is needed the [newInstance]
 * method can provide a new instance.
 */
interface Hash {
  /**
   * Add a list of bytes to the hash computation.
   */
  Hash update(List<int> data);

  /**
   * Finish the hash computation and extract the message digest as
   * a list of bytes.
   */
  List<int> digest();

  /**
   * Returns a new instance of this hash function.
   */
  Hash newInstance();

  /**
   * Block size of the hash in bytes.
   */
  int get blockSize();
}

/**
 * SHA1 hash function implementation.
 */
interface SHA1 extends Hash default _SHA1 {
  SHA1();
}

/**
 * SHA256 hash function implementation.
 */
interface SHA256 extends Hash default _SHA256 {
  SHA256();
}


/**
 * Hash-based Message Authentication Code support.
 *
 * The [update] method is used to add data to the message. The [digest] method
 * is used to extract the message authentication code.
 */
interface HMAC default _HMAC {
  /**
   * Create an [HMAC] object from a [Hash] and a key.
   */
  HMAC(Hash hash, List<int> key);

  /**
   * Add a list of bytes to the message.
   */
  HMAC update(List<int> data);

  /**
   * Perform the actual computation and extract the message digest
   * as a list of bytes.
   */
  List<int> digest();
}


/**
 * HashExceptions are thrown on invalid use of a Hash
 * object.
 */
class HashException {
  HashException(String this.message);
  toString() => "HashException: $message";
  String message;
}

