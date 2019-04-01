package com.yetirobotics.yetiscouting.preference;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

public interface PreferenceRepository extends PagingAndSortingRepository<Preference, String> {
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO preference(preference_name, preference_value) VALUES(:preferenceName, :preferenceValue) " +
        "ON DUPLICATE KEY UPDATE preference_name = :preferenceName, preference_value = :preferenceValue", nativeQuery = true)
    void updatePreference(@Param("preferenceName") String preferenceName, @Param("preferenceValue") String preferenceValue);
}
