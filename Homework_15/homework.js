db.post_reactions.aggregate([
  {
    $lookup: {
      from: "users",
      localField: "author_id",
      foreignField: "_id",
      as: "reaction_author",
    },
  },
  { $unwind: "$reaction_author" },
  {
    $lookup: {
      from: "posts",
      localField: "post_id",
      foreignField: "_id",
      as: "post",
    },
  },
  { $unwind: "$post" },
  {
    $sample: { size: 3 },
  },
  {
    $project: {
      reaction_value: "$value",
      reaction_author_fullname: "$reaction_author.fullname",
      post_title: "$post.title",
      _id: 0,
    },
  },
]);
