SELECT * FROM nashville_housing

-- Populate Property Address data

Select PropertyAddress
From nashville_housing
--Where PropertyAddress is null
order by ParcelID

-- Breaking out Address into Individual Columns (Address, City, State)

Select PropertyAddress, PropertySplitCity, PropertySplitAddress
From nashville_housing
--Where PropertyAddress is null
--order by ParcelID

SELECT
SUBSTRING(PropertyAddress, 1, POSITION (',' IN PropertyAddress) -1 ) as Address
, SUBSTRING(PropertyAddress, POSITION (',' IN PropertyAddress) + 1 , LENGTH(PropertyAddress)) as Address
From nashville_housing

ALTER TABLE nashville_housing
Add PropertySplitAddress varchar(255);

Update nashville_housing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, POSITION(',' IN PropertyAddress) -1 )


ALTER TABLE nashville_housing
Add PropertySplitCity varchar(255);

Update nashville_housing
SET PropertySplitCity = SUBSTRING(PropertyAddress, POSITION(',' IN PropertyAddress) + 1 , LENGTH(PropertyAddress))


Select OwnerAddress
From nashville_housing


SELECT
SUBSTRING(OwnerAddress, 1, POSITION (',' IN OwnerAddress) -1 ) as Address1
FROM nashville_housing