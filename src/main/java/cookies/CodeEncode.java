package cookies;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

public class CodeEncode {
    private final Base64.Encoder encoder;
    private final Base64.Decoder decoder;
    private final String initVector;
    private final String key;
    private final IvParameterSpec iv;
    private final SecretKeySpec skeySpec;

    public CodeEncode() {
        this(Base64.getEncoder(), Base64.getDecoder(),
                "RandomInitVector", // 16 bytes IV
                "2017.DAN.IT2018.");
    }

    public CodeEncode(Base64.Encoder encoder, Base64.Decoder decoder, String initVector, String key) {
        this.encoder = encoder;
        this.decoder = decoder;
        this.initVector = initVector;
        this.key = key;
        try {
            this.iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
            this.skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalArgumentException("CodeEncode: can't build instance");
        }
    }

    public String code64(String value) {
        return code64(value.getBytes(StandardCharsets.UTF_8));
    }

    public String code64(byte[] value) {
        return encoder.encodeToString(value);
    }

    public String decode64(String coded) {
        try {
            return new String(decoder.decode(coded));
        } catch (IllegalArgumentException e) {
            return "";
        }
    }

    public byte[] decode64toBytes(String coded) {
        try {
            return decoder.decode(coded);
        } catch (IllegalArgumentException e) {
            return new byte[]{};
        }
    }

    public synchronized String encrypt(String value) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
            return code64(cipher.doFinal(code64(value).getBytes()));
        } catch (Exception ex) {
            throw new IllegalArgumentException("CodeEncode: can't encode");
        }
    }

    public synchronized String decrypt(String encrypted) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            return decode64(new String(cipher.doFinal(decode64toBytes(encrypted))));
        } catch (Exception ex) {
            throw new IllegalArgumentException("CodeEncode: can't decode");
        }
    }

    public static void main(String[] args) {
        CodeEncode cc = new CodeEncode();

        String s="!Sensitive_data#";
        System.out.printf("Initial  :'%s'\n", s);

        String enc = cc.encrypt(s);
        System.out.printf("Encrypted:'%s'\n", enc);

        String dec = cc.decrypt(enc);
        System.out.printf("Decrypted:'%s'\n", dec);
    }
}
