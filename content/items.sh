#! /bin/bash

ITEM=tools/item.py

function item () {
    $ITEM "$1" "$2" < /dev/null
}

item brown_carpet "Rotted cloth"

item spruce_slab "Wooden divider"

item iron_shovel "Spoon"

$ITEM sweet_berries "Sweetberries" <<EOF
True to its name, one of the sweetest edibles in Gi.
EOF

item melon_seeds "Dried seeds"

item pufferfish "Bloated fish remains"

item dried_kelp "Dried anner"

item beetroot_soup "Congealed ronsa blood"

item cooked_beef "Rock-hard jerky?"

item wither_rose "Withered flower"

item milk_bucket "Rotted ronsa milk" <<EOF
They say it tastes the same fresh or three months old
but this might be pushing it.
EOF

item water_bucket "Stale water"
