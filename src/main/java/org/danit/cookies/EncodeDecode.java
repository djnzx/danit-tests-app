package org.danit.cookies;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import static java.nio.charset.StandardCharsets.UTF_8;

public final class EncodeDecode {
    private final static String CIPHER = "AES/CBC/PKCS5PADDING";
    private final Base64.Encoder encoder;
    private final Base64.Decoder decoder;
    private final IvParameterSpec iv;
    private final SecretKeySpec skeySpec;

    public EncodeDecode() {
        this(Base64.getEncoder(), Base64.getDecoder(),
                "RandomInitVector", // 16 bytes IV
                "2017.DAN.IT2018.");
    }

    public EncodeDecode(final Base64.Encoder enc, final Base64.Decoder dec, final String initVector, final String key) {
        this.encoder = enc;
        this.decoder = dec;
        this.iv = new IvParameterSpec(initVector.getBytes(UTF_8));
        this.skeySpec = new SecretKeySpec(key.getBytes(UTF_8), "AES");
    }

    public String code64(final String value) {
        return code64(value.getBytes(UTF_8));
    }

    public String code64(final byte[] value) {
        return encoder.encodeToString(value);
    }

    public String decode64(final String coded) {
        String result;
        try {
            result = new String(decoder.decode(coded));
        } catch (IllegalArgumentException e) {
            result = "";
        }
        return result;
    }

    public byte[] decode64toBytes(final String coded) {
        byte[] result;
        try {
            result = decoder.decode(coded);
        } catch (IllegalArgumentException e) {
            result = new byte[]{};
        }
        return result;
    }

    public String encrypt(final String value) {
        final Object o = new Object();
        try {
            synchronized (o) {
                final Cipher cipher = Cipher.getInstance(EncodeDecode.CIPHER);
                cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
                return code64(cipher.doFinal(code64(value).getBytes()));
            }
        } catch (InvalidKeyException | NoSuchAlgorithmException | InvalidAlgorithmParameterException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException ex) {
            throw new IllegalArgumentException("EncodeDecode: can't encode", ex);
        }
    }

    public String decrypt(final String encrypted) {
        final Object o = new Object();
        try {
            synchronized (o) {
                final Cipher cipher = Cipher.getInstance(EncodeDecode.CIPHER);
                cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
                return decode64(new String(cipher.doFinal(decode64toBytes(encrypted))));
            }
        } catch (InvalidKeyException | NoSuchAlgorithmException | InvalidAlgorithmParameterException | NoSuchPaddingException | IllegalBlockSizeException | BadPaddingException ex) {
            throw new IllegalArgumentException("EncodeDecode: can't decode", ex);
        }
    }
}