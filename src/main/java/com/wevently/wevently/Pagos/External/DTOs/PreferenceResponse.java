package com.wevently.wevently.Pagos.External.DTOs;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class PreferenceResponse {
    private String id;

    @JsonProperty("init_point")
    private String initPoint;

    @JsonProperty("sandbox_init_point")
    private String sandboxInitPoint;

    @JsonProperty("date_created")
    private OffsetDateTime dateCreated;

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

    // campos adicionales que MercadoPago puede devolver
    private String purpose;

    @JsonProperty("collector_id")
    private Long collectordId;

    @JsonProperty("client_id")
    private String clientId;

    @JsonProperty("marketplace")
    private String marketplace;

    @JsonProperty("marketplace_fee")
    private String marketplaceFee;

    @JsonProperty("additional_info")
    private String additionalInfo;

    @JsonProperty("expires")
    private Boolean expires;

    @JsonProperty("expiration_date_from")
    private OffsetDateTime expirationDateFrom;

    @JsonProperty("expiration_date_to")
    private OffsetDateTime expirationDateTo;

    @JsonProperty("date_of_expiration")
    private OffsetDateTime dateOfExpiration;

    // para campos que no contemple o mercado pago actualice
    @JsonProperty("metadata")
    private Map<String, Object> metadata;

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
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
        private Double unitPrice;

        @JsonProperty("currency_id")
        private String currencyId;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BackUrls {
        private String success;
        private String failure;
        private String pending;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class PaymentMethods {
        @JsonProperty("excluded_payment_methods")
        private List<ExcludedPaymentMethod> excludedPaymentMethods;

        @JsonProperty("excluded_payment_types")
        private List<ExcludedPaymentType> excludedPaymentTypes;

        @JsonProperty("installments")
        private Integer installments;

        @JsonProperty("default_payment_method_id")
        private String defaultPaymentMethodId;

        @JsonProperty("default_installments")
        private Integer defaultInstallments;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ExcludedPaymentMethod {
        private String id;
    }

    @Getter
    @Setter
    @AllArgsConstructor
    @NoArgsConstructor
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ExcludedPaymentType {
        private String id;
    }
}