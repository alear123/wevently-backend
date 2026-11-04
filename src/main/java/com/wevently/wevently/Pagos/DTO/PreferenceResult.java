package com.wevently.wevently.Pagos.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PreferenceResult {
    private String status;
    private String message;
    private String preferenceId;
    private String initPoint;
    private String sandBoxInitPoint;

    public static PreferenceResult success(String preferenceId, String initPoint, String sandBoxInitPoint) {
        return PreferenceResult.builder()
                .status("SUCCESS")
                .preferenceId(preferenceId)
                .initPoint(initPoint)
                .sandBoxInitPoint(sandBoxInitPoint)
                .message("Preferencia creada exitosamente")
                .build();
    }

    public static PreferenceResult error(String message) {
        return PreferenceResult.builder()
                .status("ERROR")
                .message(message)
                .build();
    }
}
