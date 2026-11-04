package com.wevently.wevently.Pagos.External.DTOs;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CreatePreferenceRequest {

    private List<Item> items;

    private Payer payer;

    @JsonProperty("back_urls")
    private BackUrls backUrls;

    @JsonProperty("auto_return")
    private String autoReturn;

    @JsonProperty("external_reference")
    private String externalReference;

    @JsonProperty("notification_url")
    private String notificationUrl;

    @JsonProperty("statement_descriptor")
    private String statementDescriptor;

    @JsonProperty("payment_methods")
    private PaymentMethods paymentMethods;

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class Item {
        private String id;
        private String title;
        private String description;

        @JsonProperty("picture_url")
        private String pictureUrl;

        @JsonProperty("category_id")
        private String categoryId;

        private Integer quantity;

        @JsonProperty("unit_price")
        private BigDecimal unitPrice;

        @JsonProperty("currency_id")
        private String currencyId;
    }

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class BackUrls {
        private String success;
        private String failure;
        private String pending;
    }

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class PaymentMethods {
        @JsonProperty("excluded_payment_methods")
        private List<ExcludedPaymentMethod> excludedPaymentMethods;

        @JsonProperty("excluded_payment_types")
        private List<ExcludedPaymentType> excludedPaymentTypes;

        @JsonProperty("installments")
        private Integer installments; // para decir ctas cuotas maximas se piuede
    }

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ExcludedPaymentMethod {
        private String id;
    }

    @Getter
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    public static class ExcludedPaymentType {
        private String id;
    }
}
