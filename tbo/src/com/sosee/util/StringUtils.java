package com.sosee.util;

import org.apache.oro.text.perl.Perl5Util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Random;
import java.util.Date;
import java.text.BreakIterator;
import java.util.List;
import java.util.Iterator;
import java.io.UnsupportedEncodingException;

/**
 * User: outworld
 * Date: 2005-3-16
 * Time: 13:57:03
 * To change this template use File | Settings | File Templates.
 */
public class StringUtils {

    // Constants used by escapeHTMLTags
    private static final char[] QUOTE_ENCODE = "&quot;".toCharArray();
    private static final char[] AMP_ENCODE = "&amp;".toCharArray();
    private static final char[] LT_ENCODE = "&lt;".toCharArray();
    private static final char[] GT_ENCODE = "&gt;".toCharArray();
    public StringUtils (){

    }
    //��԰����ĵĽ�ȡ
    public static String substring(String str,int len ){
      len=len*2;
     StringBuffer sb = new StringBuffer();
     int counter=0;
     for(int i=0;i<str.length();i++){
      char c = str.charAt(i);
      if(c<255){
        counter++;
      }else{
     counter=counter+2;
      }
      if(counter>len){
        break;
      }
      sb.append(c);
     }
      return sb.toString();
    }

    /**
     * ȥ���ַ������һ���
     *
     * */
    public static final StringBuffer removeLastComma(StringBuffer str){
            if(str!=null){
                    if(str.length()>0){
                                str=str.deleteCharAt(str.length()-1);
                    }
            }
            return str;
    }
    /**
     * Replaces all instances of oldString with newString in line.
     *
     * @param line the String to search to perform replacements on
     * @param oldString the String that should be replaced by newString
     * @param newString the String that will replace all instances of oldString
     *
     * @return a String will all instances of oldString replaced by newString
     */
    public static final String replace( String line, String oldString, String newString )
    {
        if (line == null) {
            return null;
        }
        int i=0;
        if ( ( i=line.indexOf( oldString, i ) ) >= 0 ) {
            char [] line2 = line.toCharArray();
            char [] newString2 = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j = i;
            while( ( i=line.indexOf( oldString, i ) ) > 0 ) {
                buf.append(line2, j, i-j).append(newString2);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length - j);
            return buf.toString();
        }
        return line;
    }

    public static final String replace( String line, char oldChar, char newChar )
    {
        if (line == null) {
            return null;
        }
        int i=0;
        if ( ( i=line.indexOf( oldChar, i ) ) >= 0 ) {
            char [] line2 = line.toCharArray();
            int oLength = 1;
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newChar);//�����ַ�׷�ӽ�ȡ
            System.out.println(buf);
            i += oLength;
            int j = i;
            while( ( i=line.indexOf( oldChar, i ) ) > 0 ) {
                buf.append(line2, j, i-j).append(newChar);
                System.out.println(buf);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length - j);
            return buf.toString();
        }
        return line;
    }
    /**
     * Replaces all instances of oldString with newString in line with the
     * added feature that matches of newString in oldString ignore case.
     *
     * @param line the String to search to perform replacements on
     * @param oldString the String that should be replaced by newString
     * @param newString the String that will replace all instances of oldString
     *
     * @return a String will all instances of oldString replaced by newString
     */
    public static final String replaceIgnoreCase(String line, String oldString,
            String newString)
    {
        if (line == null) {
            return null;
        }
        String lcLine = line.toLowerCase();
        String lcOldString = oldString.toLowerCase();
        int i=0;
        if ((i=lcLine.indexOf(lcOldString, i)) >= 0) {
            char [] line2 = line.toCharArray();
            char [] newString2 = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j = i;
            while ((i=lcLine.indexOf(lcOldString, i)) > 0) {
                buf.append(line2, j, i-j).append(newString2);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length - j);
            return buf.toString();
        }
        return line;
    }

    /**
     * Replaces all instances of oldString with newString in line with the
     * added feature that matches of newString in oldString ignore case.
     * The count paramater is set to the number of replaces performed.
     *
     * @param line the String to search to perform replacements on
     * @param oldString the String that should be replaced by newString
     * @param newString the String that will replace all instances of oldString
     * @param count a value that will be updated with the number of replaces
     *      performed.
     *
     * @return a String will all instances of oldString replaced by newString
     */
    public static final String replaceIgnoreCase(String line, String oldString,
            String newString, int [] count)
    {
        if (line == null) {
            return null;
        }
        String lcLine = line.toLowerCase();
        String lcOldString = oldString.toLowerCase();
        int i=0;
        if ((i=lcLine.indexOf(lcOldString, i)) >= 0) {
            int counter = 0;
            char [] line2 = line.toCharArray();
            char [] newString2 = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j = i;
            while ((i=lcLine.indexOf(lcOldString, i)) > 0) {
                counter++;
                buf.append(line2, j, i-j).append(newString2);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length - j);
            count[0] = counter;
            return buf.toString();
        }
        return line;
    }

   /**
    * Replaces all instances of oldString with newString in line.
    * The count Integer is updated with number of replaces.
    *
    * @param line the String to search to perform replacements on
    * @param oldString the String that should be replaced by newString
    * @param newString the String that will replace all instances of oldString
    *
    * @return a String will all instances of oldString replaced by newString
    */
    public static final String replace(String line, String oldString,
            String newString, int[] count)
    {
        if (line == null) {
            return null;
        }
        int i=0;
        if ((i=line.indexOf(oldString, i)) >= 0) {
            int counter = 0;
            counter++;
            char [] line2 = line.toCharArray();
            char [] newString2 = newString.toCharArray();
            int oLength = oldString.length();
            StringBuffer buf = new StringBuffer(line2.length);
            buf.append(line2, 0, i).append(newString2);
            i += oLength;
            int j = i;
            while ((i=line.indexOf(oldString, i)) > 0) {
                counter++;
                buf.append(line2, j, i-j).append(newString2);
                i += oLength;
                j = i;
            }
            buf.append(line2, j, line2.length-j);
            count[0] = counter;
            return buf.toString();
        }
        return line;
    }

    /**
     * This method takes a string which may contain HTML tags (ie, &lt;b&gt;,
     * &lt;table&gt;, etc) and converts the '&lt'' and '&gt;' characters to
     * their HTML escape sequences.
     *
     * @param in the text to be converted.
     * @return the input string with the characters '&lt;' and '&gt;' replaced
     *  with their HTML escape sequences.
     */
    public static final String escapeHTMLTags(String in) {
        if (in == null) {
            return null;
        }
        char ch;
        int i=0;
        int last=0;
        char[] input = in.toCharArray();
        int len = input.length;
        StringBuffer out = new StringBuffer((int)(len*1.3));
        for (; i < len; i++) {
            ch = input[i];
            if (ch > '>') {
                continue;
            } else if (ch == '<') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(LT_ENCODE);
            } else if (ch == '>') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(GT_ENCODE);
            }
        }
        if (last == 0) {
            return in;
        }
        if (i > last) {
            out.append(input, last, i - last);
        }
        return out.toString();
    }

    /**
     * Used by the hash method.
     */
    private static MessageDigest digest = null;

    /**
     * Hashes a String using the Md5 algorithm and returns the result as a
     * String of hexadecimal numbers. This method is synchronized to avoid
     * excessive MessageDigest object creation. If calling this method becomes
     * a bottleneck in your code, you may wish to maintain a pool of
     * MessageDigest objects instead of using this method.
     * <p>
     * A hash is a one-way function -- that is, given an
     * input, an output is easily computed. However, given the output, the
     * input is almost impossible to compute. This is useful for passwords
     * since we can store the hash and a hacker will then have a very hard time
     * determining the original password.
     * <p>
     * In Jive, every time a user logs in, we simply
     * take their plain text password, compute the hash, and compare the
     * generated hash to the stored hash. Since it is almost impossible that
     * two passwords will generate the same hash, we know if the user gave us
     * the correct password or not. The only negative to this system is that
     * password recovery is basically impossible. Therefore, a reset password
     * method is used instead.
     *
     * @param data the String to compute the hash of.
     * @return a hashed version of the passed-in String
     */
    public synchronized static final String hash(String data) {
        if (digest == null) {
            try {
                digest = MessageDigest.getInstance("MD5");
            }
            catch (NoSuchAlgorithmException nsae) {
                System.err.println("Failed to load the MD5 MessageDigest. " +
                "Beyond will be unable to function normally.");
                nsae.printStackTrace();
            }
        }
        // Now, compute hash.
        digest.update(data.getBytes());
        return encodeHex(digest.digest());
    }

    /**
     * Turns an array of bytes into a String representing each byte as an
     * unsigned hex number.
     * <p>
     * Method by Santeri Paavolainen, Helsinki Finland 1996<br>
     * (c) Santeri Paavolainen, Helsinki Finland 1996<br>
     * Distributed under LGPL.
     *
     * @param bytes an array of bytes to convert to a hex-string
     * @return generated hex string
     */
    public static final String encodeHex(byte[] bytes) {
        StringBuffer buf = new StringBuffer(bytes.length * 2);
        int i;

        for (i = 0; i < bytes.length; i++) {
            if (((int) bytes[i] & 0xff) < 0x10) {
                buf.append("0");
            }
            buf.append(Long.toString((int) bytes[i] & 0xff, 16));
        }
        return buf.toString();
    }

    /**
     * Turns a hex encoded string into a byte array. It is specifically meant
     * to "reverse" the toHex(byte[]) method.
     *
     * @param hex a hex encoded String to transform into a byte array.
     * @return a byte array representing the hex String[
     */
    public static final byte[] decodeHex(String hex) {
        char [] chars = hex.toCharArray();
        byte[] bytes = new byte[chars.length/2];
        int byteCount = 0;
        for (int i=0; i<chars.length; i+=2) {
            byte newByte = 0x00;
            newByte |= hexCharToByte(chars[i]);
            newByte <<= 4;
            newByte |= hexCharToByte(chars[i+1]);
            bytes[byteCount] = newByte;
            byteCount++;
        }
        return bytes;
    }

    /**
     * Returns the the byte value of a hexadecmical char (0-f). It's assumed
     * that the hexidecimal chars are lower case as appropriate.
     *
     * @param ch a hexedicmal character (0-f)
     * @return the byte value of the character (0x00-0x0F)
     */
    private static final byte hexCharToByte(char ch) {
        switch(ch) {
            case '0': return 0x00;
            case '1': return 0x01;
            case '2': return 0x02;
            case '3': return 0x03;
            case '4': return 0x04;
            case '5': return 0x05;
            case '6': return 0x06;
            case '7': return 0x07;
            case '8': return 0x08;
            case '9': return 0x09;
            case 'a': return 0x0A;
            case 'b': return 0x0B;
            case 'c': return 0x0C;
            case 'd': return 0x0D;
            case 'e': return 0x0E;
            case 'f': return 0x0F;
        }
        return 0x00;
    }

    //*********************************************************************
    //* Base64 - a simple base64 encoder and decoder.
    //*
    //*     Copyright (c) 1999, Bob Withers - bwit@pobox.com
    //*
    //* This code may be freely used for any purpose, either personal
    //* or commercial, provided the authors copyright notice remains
    //* intact.
    //*********************************************************************

    /**
     * Encodes a String as a base64 String.
     *
     * @param data a String to encode.
     * @return a base64 encoded String.
     */
    public static String encodeBase64(String data) {
        return encodeBase64(data.getBytes());
    }

    /**
     * Encodes a byte array into a base64 String.
     *
     * @param data a byte array to encode.
     * @return a base64 encode String.
     */
    public static String encodeBase64(byte[] data) {
        int c;
        int len = data.length;
        StringBuffer ret = new StringBuffer(((len / 3) + 1) * 4);
        for (int i = 0; i < len; ++i) {
            c = (data[i] >> 2) & 0x3f;
            ret.append(cvt.charAt(c));
            c = (data[i] << 4) & 0x3f;
            if (++i < len)
                c |= (data[i] >> 4) & 0x0f;

            ret.append(cvt.charAt(c));
            if (i < len) {
                c = (data[i] << 2) & 0x3f;
                if (++i < len)
                    c |= (data[i] >> 6) & 0x03;

                ret.append(cvt.charAt(c));
            }
            else {
                ++i;
                ret.append((char) fillchar);
            }

            if (i < len) {
                c = data[i] & 0x3f;
                ret.append(cvt.charAt(c));
            }
            else {
                ret.append((char) fillchar);
            }
        }
        return ret.toString();
    }

    /**
     * Decodes a base64 String.
     *
     * @param data a base64 encoded String to decode.
     * @return the decoded String.
     */
    public static String decodeBase64(String data) {
        return decodeBase64(data.getBytes());
    }

    /**
     * Decodes a base64 aray of bytes.
     *
     * @param data a base64 encode byte array to decode.
     * @return the decoded String.
     */
    public static String decodeBase64(byte[] data) {
        int c, c1;
        int len = data.length;
        StringBuffer ret = new StringBuffer((len * 3) / 4);
        for (int i = 0; i < len; ++i) {
            c = cvt.indexOf(data[i]);
            ++i;
            c1 = cvt.indexOf(data[i]);
            c = ((c << 2) | ((c1 >> 4) & 0x3));
            ret.append((char) c);
            if (++i < len) {
                c = data[i];
                if (fillchar == c)
                    break;

                c = cvt.indexOf((char) c);
                c1 = ((c1 << 4) & 0xf0) | ((c >> 2) & 0xf);
                ret.append((char) c1);
            }

            if (++i < len) {
                c1 = data[i];
                if (fillchar == c1)
                    break;

                c1 = cvt.indexOf((char) c1);
                c = ((c << 6) & 0xc0) | c1;
                ret.append((char) c);
            }
        }
        return ret.toString();
    }

    private static final int fillchar = '=';
    private static final String cvt = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "abcdefghijklmnopqrstuvwxyz"
                                    + "0123456789+/";

    /**
     * Converts a line of text into an array of lower case words using a
     * BreakIterator.wordInstance(). <p>
     *
     * This method is under the Jive Open Source Software License and was
     * written by Mark Imbriaco.
     *
     * @param text a String of text to convert into an array of words
     * @return text broken up into an array of words.
     */
    public static final String [] toLowerCaseWordArray(String text) {
        if (text == null || text.length() == 0) {
                return new String[0];
        }

        ArrayList wordList = new ArrayList();
        BreakIterator boundary = BreakIterator.getWordInstance();
        boundary.setText(text);
        int start = 0;

        for (int end = boundary.next(); end != BreakIterator.DONE;
                start = end, end = boundary.next())
        {
            String tmp = text.substring(start,end).trim();
            // Remove characters that are not needed.
            tmp = replace(tmp, "+", "");
            tmp = replace(tmp, "/", "");
            tmp = replace(tmp, "\\", "");
            tmp = replace(tmp, "#", "");
            tmp = replace(tmp, "*", "");
            tmp = replace(tmp, ")", "");
            tmp = replace(tmp, "(", "");
            tmp = replace(tmp, "&", "");
            if (tmp.length() > 0) {
                wordList.add(tmp);
            }
        }
        return (String[]) wordList.toArray(new String[wordList.size()]);
    }

    /**
     * Pseudo-random number generator object for use with randomString().
     * The Random class is not considered to be cryptographically secure, so
     * only use these random Strings for low to medium security applications.
     */
    private static Random randGen = new Random();

    /**
     * Array of numbers and letters of mixed case. Numbers appear in the list
     * twice so that there is a more equal chance that a number will be picked.
     * We can use the array to get a random number or letter by picking a random
     * array index.
     */
    private static char[] numbersAndLetters = ("0123456789abcdefghijklmnopqrstuvwxyz" +
                    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").toCharArray();

    /**
     * Returns a random String of numbers and letters (lower and upper case)
     * of the specified length. The method uses the Random class that is
     * built-in to Java which is suitable for low to medium grade security uses.
     * This means that the output is only pseudo random, i.e., each number is
     * mathematically generated so is not truly random.<p>
     *
     * The specified length must be at least one. If not, the method will return
     * null.
     *
     * @param length the desired length of the random String to return.
     * @return a random String of numbers and letters of the specified length.
     */
    public static final String randomString(int length) {
        if (length < 1) {
            return null;
        }
        // Create a char buffer to put random letters and numbers in.
        char [] randBuffer = new char[length];
        for (int i=0; i<randBuffer.length; i++) {
            randBuffer[i] = numbersAndLetters[randGen.nextInt(71)];
        }
        return new String(randBuffer);
    }

   /**
    * Intelligently chops a String at a word boundary (whitespace) that occurs
    * at the specified index in the argument or before. However, if there is a
    * newline character before <code>length</code>, the String will be chopped
    * there. If no newline or whitespace is found in <code>string</code> up to
    * the index <code>length</code>, the String will chopped at <code>length</code>.
    * <p>
    * For example, chopAtWord("This is a nice String", 10) will return
    * "This is a" which is the first word boundary less than or equal to 10
    * characters into the original String.
    *
    * @param string the String to chop.
    * @param length the index in <code>string</code> to start looking for a
    *       whitespace boundary at.
    * @return a substring of <code>string</code> whose length is less than or
    *       equal to <code>length</code>, and that is chopped at whitespace.
    */
    public static final String chopAtWord(String string, int length) {
        if (string == null) {
            return string;
        }

        char [] charArray = string.toCharArray();
        int sLength = string.length();
        if (length < sLength) {
            sLength = length;
        }

        // First check if there is a newline character before length; if so,
        // chop word there.
        for (int i=0; i<sLength-1; i++) {
            // Windows
            if (charArray[i] == '\r' && charArray[i+1] == '\n') {
                return string.substring(0, i+1);
            }
            // Unix
            else if (charArray[i] == '\n') {
                return string.substring(0, i);
            }
        }
        // Also check boundary case of Unix newline
        if (charArray[sLength-1] == '\n') {
            return string.substring(0, sLength-1);
        }

        // Done checking for newline, now see if the total string is less than
        // the specified chop point.
        if (string.length() < length) {
            return string;
        }

        // No newline, so chop at the first whitespace.
        for (int i = length-1; i > 0; i--) {
            if (charArray[i] == ' ') {
                return string.substring(0, i).trim();
            }
        }

        // Did not find word boundary so return original String chopped at
        // specified length.
        return string.substring(0, length);
    }

    // Create a regular expression engine that is used by the highlightWords
    // method below.
    private static Perl5Util perl5Util = new Perl5Util();

    /**
     * Highlights words in a string. Words matching ignores case. The actual
     * higlighting method is specified with the start and end higlight tags.
     * Those might be beginning and ending HTML bold tags, or anything else.<p>
     *
     * This method is under the Jive Open Source Software License and was
     * written by Mark Imbriaco.
     *
     * @param string the String to highlight words in.
     * @param words an array of words that should be highlighted in the string.
     * @param startHighlight the tag that should be inserted to start highlighting.
     * @param endHighlight the tag that should be inserted to end highlighting.
     * @return a new String with the specified words highlighted.
     */
    public static final String highlightWords(String string, String[] words,
        String startHighlight, String endHighlight)
    {
        if (string == null || words == null ||
                startHighlight == null || endHighlight == null)
        {
            return null;
        }

        StringBuffer regexp = new StringBuffer();

        // Iterate through each word and generate a word list for the regexp.
        for (int x=0; x<words.length; x++)
        {
            // Excape "|" and "/"  to keep us out of trouble in our regexp.
            words[x] = perl5Util.substitute("s#([\\|\\/\\.])#\\\\$1#g", words[x]);
            if (regexp.length() > 0)
            {
                regexp.append("|");
            }
            regexp.append(words[x]);
        }

        // Escape the regular expression delimiter ("/").
        startHighlight = perl5Util.substitute("s#\\/#\\\\/#g", startHighlight);
        endHighlight = perl5Util.substitute("s#\\/#\\\\/#g", endHighlight);

        // Build the regular expression. insert() the first part.
        regexp.insert(0, "s/\\b(");
        // The word list is here already, so just append the rest.
        regexp.append(")\\b/");
        regexp.append(startHighlight);
        regexp.append("$1");
        regexp.append(endHighlight);
        regexp.append("/igm");

        // Do the actual substitution via a simple regular expression.
        return perl5Util.substitute(regexp.toString(), string);
    }

    /**
     * Escapes all necessary characters in the String so that it can be used
     * in an XML doc.
     *
     * @param string the string to escape.
     * @return the string with appropriate characters escaped.
     */
    public static final String escapeForXML(String string) {
        if (string == null) {
            return null;
        }
        char ch;
        int i=0;
        int last=0;
        char[] input = string.toCharArray();
        int len = input.length;
        StringBuffer out = new StringBuffer((int)(len*1.3));
        for (; i < len; i++) {
            ch = input[i];
            if (ch > '>') {
                continue;
            } else if (ch == '<') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(LT_ENCODE);
            } else if (ch == '&') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(AMP_ENCODE);
            } else if (ch == '"') {
                if (i > last) {
                    out.append(input, last, i - last);
                }
                last = i + 1;
                out.append(QUOTE_ENCODE);
            }
        }
        if (last == 0) {
            return string;
        }
        if (i > last) {
            out.append(input, last, i - last);
        }
        return out.toString();
    }

    /**
     * Unescapes the String by converting XML escape sequences back into normal
     * characters.
     *
     * @param string the string to unescape.
     * @return the string with appropriate characters unescaped.
     */
    public static final String unescapeFromXML(String string) {
        string = replace(string, "&lt;", "<");
        string = replace(string, "&gt;", ">");
        string = replace(string, "&quot;", "\"");
        return replace(string, "&amp;", "&");
    }

    private static final char[] zeroArray = "0000000000000000".toCharArray();

    /**
     * Pads the supplied String with 0's to the specified length and returns
     * the result as a new String. For example, if the initial String is
     * "9999" and the desired length is 8, the result would be "00009999".
     * This type of padding is useful for creating numerical values that need
     * to be stored and sorted as character data. Note: the current
     * implementation of this method allows for a maximum <tt>length</tt> of
     * 16.
     *
     * @param string the original String to pad.
     * @param length the desired length of the new padded String.
     * @return a new String padded with the required number of 0's.
     */
     public static final String zeroPadString(String string, int length) {
        if (string == null || string.length() > length) {
            return string;
        }
        StringBuffer buf = new StringBuffer(length);
        buf.append(zeroArray, 0, length-string.length()).append(string);
        return buf.toString();
     }

     /**
      * Formats a Date as a fifteen character long String made up of the Date's
      * padded millisecond value.
      *
      * @return a Date encoded as a String.
      */
     public static final String dateToMillis(Date date) {
        return zeroPadString(Long.toString(date.getTime()), 15);
     }

    /**
	 * funtion: ������Ϊ�ַ����͵� List �ϲ�ƴ�ӳ�һ���ַ�,
     *          Note: List ��Ԫ�ص�����, �������ַ����,����Ϊ����Ķ���.
     *          Examle:     List list = new ArrayList();
     *                      list.add("A");list.add("B");list.add("C");
     *                      String strResult = joinList(list);
     *                      strReult ��ֵ�� "A,B,C";
     * Date : 2005-09-03
     * author : Mzy
	 * @param list
	 * @param separator
	 * @return  String
	 */
	public static String joinList(List list,String separator)
	{
		String rtVal = "";
		if(separator == null)
			separator = ",";

        Iterator it = list.iterator();
		while(it.hasNext())
        {
			rtVal += (String)it.next()+ separator;
        }

        if(rtVal.length()>1)
		    return rtVal.substring(0,rtVal.length()-1);
        else
            return rtVal;

	}

	public static String joinList(List list)
	{
		return joinList(list,null);
	}


//    /**
//     * Client program.
//     */
//    public static void main(String [] args) {
//        String in="12qwaszx~!@#$";
//        String out=null;
//        out=encodeBase64(in);
//        System.out.println(out);
//        out=decodeBase64(out);
//        System.out.println(out);
//    }

	/**
	 * ��ISO-8859-1��ʽ���ַ�ת��ΪGBK��ʽ��
	 * @return  String
	 */
	public static String ISOToGBK(String str){
		if(str !=null){
			try {
				return new String(str.getBytes("ISO-8859-1"),"GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
			}
		}
		return null;
	}

	/**
	 * ��GBK��ʽ���ַ�ת��ΪISO-8859-1��ʽ��
	 * @return  String
	 */
	public static String GBKToISO(String str){
		if(str !=null){
			try {
				return new String(str.getBytes("GBK"),"ISO-8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
			}
		}
		return null;
	}

	/**
	 * �� UTF-8 ��ʽ���ַ�ת��ΪGBK��ʽ��
	 * @return String
	 */
	public static String UTFToGBK(String str){
		if(str !=null){
			try {
				return new String(str.getBytes("UTF-8"),"GBK");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
			}
		}
		return null;
	}

	/**
	 * ��GBK��ʽ���ַ�ת��Ϊ UTF-8 ��ʽ��
	 * @return String
	 */
	public static String GBKToUTF(String str){
		if(str !=null){
			try {
				return new String(str.getBytes("GBK"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
			}
		}
		return null;
	}

    public static String createInSQL(String srcStr,String seperator,boolean isString)
    {
        String rtVal = "";
        String[] arr = srcStr.split(seperator);
        if(isString)
        {
            for(int i=0;i<arr.length;i++)
            {
                 rtVal += "'"+arr[i]+"',";
            }
        }
        else
        {
            for(int i=0;i<arr.length;i++)
            {
                 rtVal += ""+arr[i]+",";
            }
        }
        if(rtVal.length()>2) rtVal = rtVal.substring(0,rtVal.length()-1);
        return rtVal;
    }

    public static boolean isEmptyString(String str)
    {
    	if(str==null||str.trim().length()==0)
    		return true;
    	return false;
    }
    
    public static boolean isNullString(String str)
    {
    	if(str==null||str.trim().length()==0)
    		return true;
    	else if("null".equalsIgnoreCase(str))
    		return true;
    	return false;
    }
    
    public static String getBehindStr(String str,int length)
    {
    	if(str==null||str.length()<=length)
    		return str;
    	int start =str.length()-length;
    	return str.substring(start);
    }
    
    public static String fillCharToLen(String src,char chr,int length)
    {
    	if(src==null||src.length()>=length)
    		return src;
    	StringBuffer sb=new StringBuffer();
    	for(int i=0;i<length-src.length();i++)
    	{
    		sb.append(chr);
    	}
		sb.append(src);
    	return sb.toString();
    }
    
    public static void  main(String[] args){
    	System.out.println(StringUtils.encodeBase64("0"));
    	System.out.println(StringUtils.encodeBase64("123456"));
    	System.out.println(StringUtils.encodeBase64("admin"));
    	String test="C6010006703789";
    	System.out.println(StringUtils.getBehindStr(test, 10));
    	System.out.println(StringUtils.fillCharToLen(test,'a', 30));
    }
}
