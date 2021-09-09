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
//import UIKit
//import MapKit
//import MessageKit
//import InputBarAccessoryView
////import MessageInputBar
//import XLPagerTabStrip
//import Nuke
//
//class ChatViewController: MessagesViewController, MessagesDataSource, IndicatorInfoProvider, MVVMViewController, Storyboardable {
//
//    static var storyboardName: String { return "Chat" }
//    static var storyboardIdentifier: String { return "ChatViewController" }
//    
//    typealias ViewModel = ChatViewModel
//    
//    var viewModel = ChatViewModel()
//    
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//        return IndicatorInfo(title: "chat".localized.uppercased())
//    }
//    
//    private lazy var isTypingView: IsTypingView = {
//        let isTypingView = R.nib.isTypingView(owner: nil)!
//        isTypingView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 50)
//        return isTypingView
//    }()
//    private lazy var emojiInputView: EmojiInputView = {
//        let inputView = R.nib.emojiInputView.firstView(owner: nil)!
//        inputView.emojiDelegate = self
//        return inputView
//    }()
//    
//    private lazy var chatBackgroundImageView: UIImageView? = {
//        let chatBackgroundImageView = UIImageView(frame: messagesCollectionView.bounds)
//        guard let urlString = ThemeService.shared.chatBackground.backgroundImageUrl,
//            let url = URL(string: urlString) else { return nil }
//        Nuke.loadImage(with: url, into: chatBackgroundImageView)
//        return chatBackgroundImageView
//    }()
//    
//    private var replyToMessageId: String?
//    var leftItems: [ InputBarButtonItem]!
//    var messageList: [CustomMessageType] = []
//    
//    let refreshControl = UIRefreshControl()
//    
//    var chatType: ChatType!
//    
//    override func viewDidLoad() {
//        bindViewModel()
//        configureMessageCollectionView()
//        configureMessageInputBar()
//        configureTextView()
//        configureInputBarItems()
//        configureSendButton()
//        super.viewDidLoad()
//        loadFirstMessages()
//        viewModel.fetchEmojis()
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        becomeFirstResponder()
//        MockSocket.shared.connect(with: [SampleData.shared.steven, SampleData.shared.wu])
//            .onTypingStatus { [weak self] in
//                self?.setTypingIndicatorHidden(false)
//            }.onNewMessage { [weak self] message in
//                self?.insertMessage(message)
//        }
//    }
//    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        MockSocket.shared.disconnect()
//    }
//    
//    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
//        return messageList[indexPath.section].asMessageType()
//    }
//    // MARK: - Helpers
//    
//    func insertMessage(_ message: CustomMessageType) {
//        messageList.append(message)
//        // Reload last section to update header/footer labels and insert a new one
//        messagesCollectionView.performBatchUpdates({
//            messagesCollectionView.insertSections([messageList.count - 1])
//            if messageList.count >= 2 {
//                messagesCollectionView.reloadSections([messageList.count - 2])
//            }
//        }, completion: { [weak self] _ in
//            if self?.isLastSectionVisible() == true {
//                self?.messagesCollectionView.scrollToBottom(animated: true)
//            }
//        })
//    }
//    
//    func isLastSectionVisible() -> Bool {
//        guard !messageList.isEmpty else { return false }
//        
//        let lastIndexPath = IndexPath(item: 0, section: messageList.count - 1)
//        
//        return messagesCollectionView.indexPathsForVisibleItems.contains(lastIndexPath)
//    }
//    
//    // MARK: - MessagesDataSource
//    
//    private func currentUser() -> UserModel {
//        return SampleData.shared.currentSender
//    }
//    
//    func currentSender() -> SenderType {
//        return currentUser().asSender()
//    }
//    
//    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
//        return messageList.count
//    }
//    
//    func loadFirstMessages() {
//        DispatchQueue.global(qos: .userInitiated).async {
//            SampleData.shared.getAdvancedMessages(count: 20) { messages in
//                DispatchQueue.main.async {
//                    self.messageList = messages
//                    self.messagesCollectionView.reloadData()
//                    self.messagesCollectionView.scrollToBottom()
//                }
//            }
//        }
//    }
//    
//    @objc func loadMoreMessages() {
//        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1) {
//            SampleData.shared.getAdvancedMessages(count: 20) { messages in
//                DispatchQueue.main.async {
//                    self.messageList.insert(contentsOf: messages, at: 0)
//                    self.messagesCollectionView.reloadDataAndKeepOffset()
//                    self.refreshControl.endRefreshing()
//                }
//            }
//        }
//    }
//    
//    func configureMessageCollectionView() {
//        leftItems = [makeButton(image: R.image.search_white()!), makeButton(image: R.image.month_white()!)]
//        messagesCollectionView = MessagesCollectionView(frame: .zero, collectionViewLayout: CustomMessagesFlowLayout(chatType: chatType))
//        messagesCollectionView.register(ChatCollectionViewCell.self)
//        messagesCollectionView.register(SystemMessageCell.self)
//        messagesCollectionView.backgroundColor = .white
//        messagesCollectionView.backgroundView = chatBackgroundImageView
//        
//        messagesCollectionView.messagesDataSource = self
//        messagesCollectionView.messagesLayoutDelegate = self
//        messagesCollectionView.messagesDisplayDelegate = self
//        messagesCollectionView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
//        messagesCollectionView.addSubview(refreshControl)
//        refreshControl.addTarget(self, action: #selector(loadMoreMessages), for: .valueChanged)
//        
//        let layout = messagesCollectionView.collectionViewLayout as? CustomMessagesFlowLayout
//        layout?.sectionFootersPinToVisibleBounds = true
//        layout?.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 10, right: 8)
//        layout?.setMessageOutgoingAvatarSize(.zero)
//        layout?.setMessageIncomingAccessoryViewSize(.zero)
//        layout?.setMessageOutgoingAccessoryViewSize(.zero)
//        
//        scrollsToBottomOnKeyboardBeginsEditing = true
//        maintainPositionOnKeyboardFrameChanged = true
//    }
//    
//    func configureMessageInputBar() {
//        messageInputBar = MessageInputBar()
////        messageInputBar.
////        messageInputBar.delegate = self
//        messageInputBar.separatorLine.isHidden = true
//        messageInputBar.contentView.backgroundColor = R.color.appLightGray()
//    }
//    
//    fileprivate func configureTextView() {
//        let inputTextView = messageInputBar.inputTextView
//        inputTextView.tintColor = .lightGray
//        inputTextView.allowsEditingTextAttributes = true
//        inputTextView.backgroundColor = R.color.appLightGray()!
//        inputTextView.placeholderTextColor = R.color.appGrayMagnesium()!
//        inputTextView.placeholder = R.string.localizable.newMessage().capitalizeWords()
//        inputTextView.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
//        inputTextView.placeholderLabelInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
//        inputTextView.layer.borderColor = R.color.appGrayMagnesium()!.cgColor
//        inputTextView.layer.borderWidth = 1.0
//        inputTextView.layer.cornerRadius = 16.0
//        inputTextView.layer.masksToBounds = true
//        inputTextView.scrollIndicatorInsets = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
//        inputTextView.delegate = self
//    }
//    
//    private func configureInputBarItems() {
//        messageInputBar.rightStackView.distribution = .fillEqually
//        messageInputBar.setRightStackViewWidthConstant(to: 0, animated: false)
//        messageInputBar.textViewPadding.left = 8
//        messageInputBar.setLeftStackViewWidthConstant(to: 72, animated: false)
//        messageInputBar.setStackViewItems(leftItems, forStack: .left, animated: false)
//    }
//    
//    private func configureSendButton() {
//        let sendButton = messageInputBar.sendButton
//        sendButton.tintColor = .lightGray
//        sendButton.contentEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
//        sendButton.setSize(CGSize(width: 36, height: 36), animated: false)
//        sendButton.image = R.image.arrow_Right_Blue()!.withRenderingMode(.alwaysTemplate)
//        sendButton.title = nil
//        sendButton.isHidden = true
//    }
//    
//    // MARK: - Helpers
//    
//    func setTypingIndicatorHidden(_ isHidden: Bool, performUpdates updates: (() -> Void)? = nil) {
//        if isHidden {
//            messageInputBar.setStackViewItems([], forStack: .top, animated: true)
//        } else {
//            showTypingView(typers: ["Henk"])
//        }
//    }
//    
//    private func makeButton(image: UIImage) -> InputBarButtonItem {
//        return InputBarButtonItem()
//            .configure {
//                $0.spacing = .flexible
//                $0.image = image.withRenderingMode(.alwaysTemplate)
//                $0.setSize(CGSize(width: 36, height: 36), animated: false)
//                $0.tintColor = R.color.appGrayMagnesium()!
//            }.onSelected {
//                $0.tintColor = R.color.appDimGray()!
//            }.onDeselected {
//                $0.tintColor = R.color.appGrayMagnesium()!
//            }.onTouchUpInside { _ in
//                self.toggleInputView()
//        }
//    }
//    
//    private func toggleInputView() {
//        if messageInputBar.inputTextView.inputView != nil {
//            messageInputBar.inputTextView.inputView = nil
//        } else {
//            messageInputBar.inputTextView.inputView = emojiInputView
//        }
//        messageInputBar.inputTextView.reloadInputViews()
//    }
//    
//    private func showTypingView(typers: [String]) {
//        isTypingView.setTypers(typers)
//        messageInputBar.setStackViewItems([isTypingView], forStack: .top, animated: true)
//    }
//    
//    // MARK: - UICollectionViewDataSource
//    
//    override public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        guard let messagesDataSource = messagesCollectionView.messagesDataSource else {
//            fatalError("Ouch. nil data source for messages")
//        }
//        
//        let message = messagesDataSource.messageForItem(at: indexPath, in: messagesCollectionView)
//        
//        if case .custom(let messageKind) = message.kind,
//            let kind = messageKind {
//            if let userMessage = kind as? UserMessage {
//                let cell = messagesCollectionView.dequeueReusableCell(ChatCollectionViewCell.self, for: indexPath)
//                if let emojisModel = self.viewModel.emojis {
//                    let emojis = emojisModel.data.categories.flatMap { $0.emojis }
//                    cell.configure(with: userMessage, chatType: chatType, emojis: emojis, version: emojisModel.data.version)
//                }
//                return cell
//            } else if let systemMessage = kind as? SystemMessage {
//                let cell = messagesCollectionView.dequeueReusableCell(SystemMessageCell.self, for: indexPath)
//                cell.configure(with: systemMessage, at: indexPath, and: messagesCollectionView)
//                return cell
//            } else {
//                fatalError("Message kind shouldn't be possible: \(kind)")
//            }
//        }
//        
//        return super.collectionView(collectionView, cellForItemAt: indexPath)
//    }
//}
//
//// MARK: - MessagesDisplayDelegate
//
//extension ChatViewController: MessagesDisplayDelegate, MessagesLayoutDelegate {
//    
//    func backgroundColor(for message: MessageType, at  indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
//        return .clear
//    }
//}
//
//extension ChatViewController: UITextViewDelegate {
//    
//    func textViewDidChange(_ textView: UITextView) {
//        var fullString = NSMutableAttributedString(attributedString: textView.attributedText)
//        fullString.addAttributes([
//            .font: R.font.openSans(size: 16)!,
//            .foregroundColor: UIColor.darkText
//            ], range: NSRange(location: 0, length: fullString.string.count))
//        
//        if let data = viewModel.emojis?.data {
//            let emojis = data.categories.flatMap { $0.emojis }
//            fullString = fullString.replaceEmoji(emojis: emojis, version: data.version)
//        }
//        
//        if case .MOM = chatType! {
//            fullString = fullString.replaceFirstReply(messages: messageList)
//        }
//        
//        textView.attributedText = fullString
//        
//        toggleSendButton(textView)
//    }
//    
//    private func toggleSendButton(_ textView: UITextView) {
//        let isTyping = textView.text.count <= 0
//        let width: CGFloat = isTyping ? 0 : 36
//        messageInputBar.setRightStackViewWidthConstant(to: width, animated: true)
//        UIView.animate(withDuration: 0.3) {
//            self.messageInputBar.sendButton.isHidden = isTyping
//            self.view.layoutIfNeeded()
//        }
//    }
//}
//
//extension ChatViewController: MessageInputBarDelegate {
//    
//    func messageInputBar(_ inputBar: MessageInputBar, textViewTextDidChangeTo text: String) {
//        setTypingIndicatorHidden(text.count <= 0)
//    }
//    
//    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
//        let id = String(NSUUID().uuidString.prefix(4))
//        
//        let content = toText(components: inputBar.inputTextView.components)
//        var response: String?
//        let words = text.split(separator: " ")
//        if let first = words.first,
//            first.starts(with: "@"),
//            let found = messageList.first(
//                where: { $0.asMessageType().messageId == String(first.dropFirst()) }
//            ),
//            case .custom(let message) = found.asMessageType().kind,
//            let userMessage = message as? UserMessage {
//            response = userMessage.content
//        }
//        
//        let message = UserMessage(messageId: id, content: content, sentDate: Date(), sender: currentUser(), response: response)
//        insertMessage(message)
//        
//        inputBar.inputTextView.text = String()
//        messagesCollectionView.scrollToBottom(animated: true)
//    }
//    
//    private func toText(components: [Any]) -> String {
//        return components.map {
//                if let str = $0 as? String {
//                    return str
//                } else if let img = $0 as? UIImage, let id = img.accessibilityIdentifier {
//                    return id
//                } else {
//                    return " "
//                }
//                }.reduce("", +)
//    }
//}
//
//private extension ChatViewController {
//    func bindViewModel() {
//        self.viewModel.stateHandler = { [weak self] state in
//            switch state {
//            case .value(let val):
//                switch val {
//                case .fetchedEmojis:
//                    self?.emojiInputView.emojiModel = self!.viewModel.emojis!
//                    let layout = self?.messagesCollectionView.collectionViewLayout as? CustomMessagesFlowLayout
//                    let emojis = self!.viewModel.emojis!.data.categories.flatMap { $0.emojis }
//                    layout?.setEmojis(emojis, version: self!.viewModel.emojis!.data.version)
//                }
//            case .error(let error):
//                print(error.localizedDescription)
//            default: break
//            }
//        }
//    }
//}
//
//extension ChatViewController: EmojiDelegate {
//    func emojiTapped(_ emojiCode: String) {
//        let text = NSMutableAttributedString(attributedString: messageInputBar.inputTextView.attributedText)
//        let attributedEmojiCode = NSAttributedString(string: emojiCode, attributes: [.font: R.font.openSans(size: 16)!])
//        text.append(attributedEmojiCode)
//        guard let emojisModel = viewModel.emojis else { return }
//        let emojis = emojisModel.data.categories.flatMap { $0.emojis }
//        messageInputBar.inputTextView.attributedText = text.replaceEmoji(emojis: emojis, version: emojisModel.data.version)
//    }
//}
