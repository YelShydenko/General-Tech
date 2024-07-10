// Вывести среднюю реакцию по всем публикациям
db.post_reactions.aggregate([
  {
    $group: {
      _id: null,
      average_reaction: { $avg: "$value" },
    },
  },
  {
    $project: {
      _id: 0,
      average_reaction: 1,
    },
  },
]);

// Вывести среднюю реакцию авторов из USA
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
    $match: {
      "reaction_author.country": "USA",
    },
  },
  {
    $group: {
      _id: null,
      average_reaction: { $avg: "$value" },
    },
  },
  {
    $project: {
      _id: 0,
      average_reaction: 1,
    },
  },
]);

// Увеличить баланс всех не заблокированных юзеров на 0.5%
db.users.updateMany(
   { blocked: { $ne: true } },
   { $mul: { balance: 1.005 } }
);

// Вывести ко-во реакций с оценкой 4
db.post_reactions.countDocuments(
   { value: 4 }
);