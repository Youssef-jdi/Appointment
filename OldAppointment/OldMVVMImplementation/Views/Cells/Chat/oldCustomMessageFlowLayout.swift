///*
// MIT License
// 
// Copyright (c) 2017-2018 MessageKit
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// */
//
//import Foundation
//import MessageKit
//
//open class CustomMessagesFlowLayout: MessagesCollectionViewFlowLayout {
//    
//    private var messageSizeCalculator: CustomMessageSizeCalculator!
//    
//    init(chatType: ChatType) {
//        super.init()
//        self.messageSizeCalculator = CustomMessageSizeCalculator(layout: self, chatType: chatType)
//    }
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override open func cellSizeCalculatorForItem(at indexPath: IndexPath) -> CellSizeCalculator {
//        let message = messagesDataSource.messageForItem(at: indexPath, in: messagesCollectionView)
//        if case .custom = message.kind {
//            return messageSizeCalculator
//        }
//        return super.cellSizeCalculatorForItem(at: indexPath)
//    }
//    
//    override open func messageSizeCalculators() -> [MessageSizeCalculator] {
//        var superCalculators = super.messageSizeCalculators()
//        superCalculators.append(messageSizeCalculator)
//        return superCalculators
//    }
//    
//    func setEmojis(_ emojis: [EmojiModel.Datum.Emoji], version: Int) {
//        messageSizeCalculator.version = version
//        messageSizeCalculator.emojis = emojis
//    }
//}
