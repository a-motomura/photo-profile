class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '自然' },
    { id: 2, name: '寺社仏閣' },
    { id: 3, name: 'その他の建造物' },
    { id: 4, name: '食べ物' },
    { id: 5, name: '飲み物' },
    { id: 6, name: 'デザート' },
    { id: 7, name: 'その他' }
  ]
end
