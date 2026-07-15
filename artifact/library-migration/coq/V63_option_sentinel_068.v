(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_068.
Definition enc_68 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_68 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_68 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_68 : forall o : option nat, dec_68 (enc_68 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_68 : forall o : option nat, enc_68 o = size_68 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_68 : forall o : option nat, enc_68 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_068.

