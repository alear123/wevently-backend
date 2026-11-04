package com.wevently.wevently.Pagos.Util;

import java.math.BigDecimal;

public class NumUtil {

        private static final String[] UNIDADES = {
                        "", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", "diez",
                        "once", "doce", "trece", "catorce", "quince", "dieciséis", "diecisiete", "dieciocho",
                        "diecinueve", "veinte"
        };
        private static final String[] DECENAS = {
                        "", "", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", "noventa"
        };
        private static final String[] CENTENAS = {
                        "", "cien", "doscientos", "trescientos", "cuatrocientos", "quinientos",
                        "seiscientos", "setecientos", "ochocientos", "novecientos"
        };

        public static String getNumeroEnLetras(BigDecimal monto) {
                long parteEntera = monto.longValue();
                int parteDecimal = monto.remainder(BigDecimal.ONE)
                                .movePointRight(monto.scale() > 2 ? 2 : monto.scale())
                                .intValue();

                String letras = convertir(parteEntera) + " con " + String.format("%02d", parteDecimal) + "/100";
                return letras.substring(0, 1).toUpperCase() + letras.substring(1);
        }

        private static String convertir(long valor) {
                if (valor < 21)
                        return UNIDADES[(int) valor];
                else if (valor < 100)
                        return DECENAS[(int) valor / 10] +
                                        (valor % 10 != 0 ? " y " + UNIDADES[(int) valor % 10] : "");
                else if (valor < 1000)
                        return CENTENAS[(int) valor / 100] +
                                        ((valor % 100 != 0) ? " " + convertir(valor % 100) : "");
                else if (valor < 1000000) {
                        String miles = (valor / 1000 == 1) ? "mil" : convertir(valor / 1000) + " mil";
                        return miles + ((valor % 1000 != 0) ? " " + convertir(valor % 1000) : "");
                } else
                        return String.valueOf(valor);
        }
}
