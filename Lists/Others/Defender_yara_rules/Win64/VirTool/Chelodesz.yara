rule VirTool_Win64_Chelodesz_A_2147907206_0
{
    meta:
        author = "defender2yara"
        detection_name = "VirTool:Win64/Chelodesz.A!MTB"
        threat_id = "2147907206"
        type = "VirTool"
        platform = "Win64: Windows 64-bit platform"
        family = "Chelodesz"
        severity = "Critical"
        info = "MTB: Microsoft Threat Behavior"
        signature_type = "SIGNATURE_TYPE_PEHSTR_EXT"
        threshold = "4"
        strings_accuracy = "Low"
    strings:
        $x_1_1 = {4c 8b 45 17 ?? ?? ?? ?? ?? ?? ?? 48 8b 55 f7 ?? ?? ?? ?? ?? 48 8b 55 07 [0-18] 4c 8b 4d 07 ?? ?? ?? ?? 48 8b 55 f7 4d 8b c6 48 8b cb 48 89 44 24 20 ?? ?? ?? ?? ?? 85 c0 ?? ?? ?? ?? ?? ?? 48 8b 55 1f 4c 8b 45 07 49 3b d0}  //weight: 1, accuracy: Low
        $x_1_2 = {4c 8b 45 07 33 d2 49 8b ce ?? ?? ?? ?? ?? ?? ?? ?? ?? 41 b9 40 00 00 00 ?? ?? ?? ?? 48 89 44 24 20 ?? ?? ?? ?? 48 8b cb ?? ?? ?? ?? ?? 85 c0 [0-20] 48 8b ce ?? ?? ?? ?? ?? ?? 48 8b 55 f7 ?? ?? ?? ?? ?? ?? ?? 44 8b c0}  //weight: 1, accuracy: Low
        $x_1_3 = {48 8b c8 48 89 5c 24 20 ?? ?? ?? ?? ?? ?? 48 85 c0 ?? ?? 48 8b cd ?? ?? ?? ?? ?? ?? b8 ff ff ff ff ?? ?? ?? ?? ?? 48 89 5c 24 38 ?? ?? ?? ?? ?? ?? ?? c7 44 24 30 00 00 00 04}  //weight: 1, accuracy: Low
        $x_1_4 = {48 89 6c 24 30 ?? ?? ?? ?? ?? ?? ?? ?? c7 44 24 28 00 01 00 00 45 33 c9 45 33 c0 c7 44 24 20 02 00 00 00 ba 00 00 00 40 ?? ?? ?? ?? ?? ?? 48 8b f8 48 83 f8 ff [0-18] ba 08 00 00 00 41 b8 ff ff 0f 00 48 8b c8}  //weight: 1, accuracy: Low
    condition:
        (filesize < 20MB) and
        (all of ($x*))
}

