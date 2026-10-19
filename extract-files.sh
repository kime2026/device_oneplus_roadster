#!/bin/bash
#
# Script to dump proprietary blobs for roadster
#

DEVICE=roadster
VENDOR=oneplus

echo "Extracting proprietary files for ${VENDOR}/${DEVICE}..."
# In standard workflow, this script reads proprietary-files.txt
# and dumps blobs from official firmware payloads or mounted system images.
