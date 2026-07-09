-- My Voxel Game - Core Mod
-- نظام الحقيبة والكرافتينق وتوزيع الأزرار على الشاشة

-- 1. تغيير تصميم وأماكن شاشة الكرافتينق والحقيبة للاعب
core.register_on_joinplayer(function(player)
    -- تصميم الواجهة (Formspec) بأبعاد مخصصة وألوان متناسقة مع الشعار الجديد
    local crafting_formspec = 
        "formspec_version[4]" ..
        "size[11,10]" .. -- حجم النافذة الكلي (العرض 11، الارتفاع 10)
        
        -- تطبيق الألوان النحاسية الخاصة بشعارك على مربعات الأدوات والأزرار داخل الحقيبة
        "style_type[list;bgcolor=#1e262c;idcolor=#8c7453]" .. 
        "style_type[button;bgcolor=#8c7453;bgcolor_hovered=#a68d6b;textcolor=#e1e7ed]" ..

        -- [قسم الكرافتينق - التصنيع]
        "label[1,0.75;أدوات التصنيع (Crafting)]" ..
        "list[current_player;craft;1,1.5;3,3;]" .. -- شبكة التصنيع 3x3 في جهة اليسار
        
        -- سهم يشير إلى المادة الناتجة من التصنيع
        "image[4.75,2.5;1,1;gui_arrow_blank.png]" ..
        
        -- مربع ظهور الشيء المصنوع (المعاينة)
        "list[current_player;craftpreview;6.5,2.5;1,1;]" ..

        -- [قسم الحقيبة - Inventory]
        "label[1,5.25;الحقيبة (Inventory)]" ..
        -- توزيع مربعات حقيبة اللاعب في الأسفل (8 أعمدة في 4 صفوف)
        "list[current_player;main;1,6;8,4;]"

    -- تطبيق التصميم الجديد على اللاعب بمجرد دخوله اللعبة
    player:set_inventory_formspec(crafting_formspec)
end)

--------------------------------------------------------------------------------
-- 2. طريقة الكرافتينق (Crafting Recipes)
-- هنا تتحكم في الوصفات (ماذا ينتج عند دمج المواد)
--------------------------------------------------------------------------------

-- مثال 1: طريقة صنع سيف (تستطيع تغيير أسماء المواد بناءً على مودات لعبتك)
core.register_craft({
    output = "default:sword_stone", -- الشيء الناتج
    recipe = {
        {"default:cobblestone"},    -- المربع العلوي في شبكة الكرافتينق
        {"default:cobblestone"},    -- المربع الأوسط
        {"default:stick"}           -- المربع السفلي
    }
})

-- مثال 2: طريقة صنع طاولة عمل أو صندوق
core.register_craft({
    output = "default:chest 2", -- ينتج صندوقين
    recipe = {
        {"group:wood", "group:wood", "group:wood"},
        {"group:wood", "",           "group:wood"},
        {"group:wood", "group:wood", "group:wood"}
    }
})

