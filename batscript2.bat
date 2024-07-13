@echo off
setlocal enabledelayedexpansion

:menu
echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral

set /p choice="Enter your choice (1, 2, or 3): "

if "%choice%" == "1" goto circle
if "%choice%" == "2" goto triangle
if "%choice%" == "3" goto quadrilateral

echo Invalid choice, please enter 1, 2, or 3.
goto menu

:circle
set /p radius="Enter the radius of the circle: "
set /a area=314159265 * radius * radius / 100000000
echo Area of the circle: !area!
goto end

:triangle
set /p side1="Enter the length of side 1 of the triangle: "
set /p side2="Enter the length of side 2 of the triangle: "
set /p side3="Enter the length of side 3 of the triangle: "
set /a s=(side1 + side2 + side3) / 2
set /a area=s * (s - side1) * (s - side2) * (s - side3)
set /a area=%area% ** 0.5
echo Area of the triangle: !area!

if %side1% == %side2% if %side2% == %side3% (
    echo Equilateral Triangle
) else if %side1% == %side2% if not %side1% == %side3% (
    echo Isosceles Triangle
) else if %side2% == %side3% if not %side2% == %side1% (
    echo Isosceles Triangle
) else if %side1% == %side3% if not %side1% == %side2% (
    echo Isosceles Triangle
) else (
    echo Scalene Triangle
)
goto end

:quadrilateral
set /p length="Enter the length of the quadrilateral: "
set /p width="Enter the width of the quadrilateral: "
set /a area=length * width
echo Area of the quadrilateral: !area!

if %length% == %width% (
    echo Square
) else (
    echo Rectangle
)
goto end

:end
pause
exit
