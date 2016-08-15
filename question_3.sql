SELECT
  d.id
  COUNT(b.dog_id) AS Bone_Count,
  AVG(b.rating) AS Bone_Rating,
FROM
  Dogs d LEFT JOIN
  Bones b ON d.id = b.dog_id
GROUP BY
  d.id

Dog.left_outer_joins(:bones).select('dogs.id, COUNT(bones.dog_id) AS bone_count, AVG(bones.rating) AS bone_rating').group('dogs.id')
