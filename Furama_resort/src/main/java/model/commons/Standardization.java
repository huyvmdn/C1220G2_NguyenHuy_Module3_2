package model.commons;

public interface Standardization {
    public static String standardizeString(String str) {
        String newStr = str.toLowerCase().trim().replaceAll("\\s+", " ");
        String[] arrTemp = newStr.split("");
        newStr = arrTemp[0].toUpperCase();
        for (int i = 1; i < arrTemp.length; i++) {
            if (arrTemp[i - 1].equals(" ")) {
                newStr += arrTemp[i].toUpperCase();
            } else {
                newStr += arrTemp[i];
            }
        }
        return newStr;
    }
}
