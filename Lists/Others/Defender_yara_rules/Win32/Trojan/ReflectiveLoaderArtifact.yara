rule Trojan_Win32_ReflectiveLoaderArtifact_A_2147784772_0
{
    meta:
        author = "defender2yara"
        detection_name = "Trojan:Win32/ReflectiveLoaderArtifact.A"
        threat_id = "2147784772"
        type = "Trojan"
        platform = "Win32: Windows 32-bit platform"
        family = "ReflectiveLoaderArtifact"
        severity = "Critical"
        signature_type = "SIGNATURE_TYPE_PEHSTR_EXT"
        threshold = "1"
        strings_accuracy = "Low"
    strings:
        $x_1_1 = {8e 4e 0e ec 74 ?? ?? ?? ?? aa fc 0d 7c 74}  //weight: 1, accuracy: Low
        $x_1_2 = {8e 4e 0e ec 74 ?? ?? aa fc 0d 7c 74}  //weight: 1, accuracy: Low
    condition:
        (filesize < 20MB) and
        (1 of ($x*))
}

